@import <AppKit/CPView.j>
@import "ContactView.j"

var defaultColor   = [CPColor colorWithHexString:@"4F4F4F"],
    highlightColor = [CPColor colorWithHexString:@"0086F0"];

@implementation BookView : CPView
{
    id              controller;
    CPSearchField   searchField;
    BOOL            searchApplied;
    CPArray         searchResults;
    ContactView     contactView;
    CPScrollView    listScrollView;
    CPTableView     theListView;
    CPButton        addButton;
    CPButton        editButton;
    CPButton        removeButton;
    CPTextField     contactString;

}

- (id)initWithFrame:(CPRect)aFrame controller:(id)aController
{
    if(self = [super initWithFrame:aFrame])
    {
        [self setBackgroundColor:[CPColor colorWithHexString:@"bababa"]];
        [self setAutoresizingMask:CPViewMinXMargin | CPViewMinYMargin | CPViewMaxXMargin | CPViewMaxYMargin];

        controller    = aController;
        searchApplied = NO;

        searchField = [[CPSearchField alloc] initWithFrame:CGRectMake(365,0,130,30)];
        [searchField setTarget:self];
        [searchField setAction:@selector(searchStringDidApply:)];
        [self addSubview:searchField];

        var nameColumn = [[CPTableColumn alloc] initWithIdentifier:@"name"];
        [nameColumn setWidth:160];

        listView = [[CPTableView alloc] initWithFrame:CGRectMake(0,0,160,240)];
        [listView setHeaderView:nil];
        [listView setCornerView:nil];
        [listView addTableColumn:nameColumn];
        [listView setDelegate:self];
        [listView setDataSource:self];

        listScrollView = [[CPScrollView alloc] initWithFrame:CGRectMake(1,30,175,240)];
        [listScrollView setBackgroundColor:[CPColor whiteColor]];
        [listScrollView setHasHorizontalScroller:NO];
        [listScrollView setAutohidesScrollers:YES];
        [listScrollView setDocumentView:listView];
        [self addSubview:listScrollView];

        contactView = [[ContactView alloc] initWithFrame:CGRectMake(175,30,324,240)];
        [contactView setBackgroundColor:[CPColor whiteColor]];
        [self addSubview:contactView];

        addButton = [CPButton buttonWithTitle:@"+"];
        [addButton setFrame:CGRectMake(5,273,20,24)];
        [addButton setTarget:self];
        [addButton setAction:@selector(addButtonDidClick:)];
        [self addSubview:addButton];

        removeButton = [CPButton buttonWithTitle:@"-"];
        [removeButton setFrame:CGRectMake(29,273,20,24)];
        [removeButton setTarget:self];
        [removeButton setAction:@selector(removeButtonDidClick:)];
        [self addSubview:removeButton];

        editButton = [CPButton buttonWithTitle:@"Edit"];
        [editButton setFrame:CGRectMake(175,273,50,24)];
        [editButton setTarget:self];
        [editButton setAction:@selector(editButtonDidClick:)];
        [self addSubview:editButton];

        contactString = [[CPTextField alloc] initWithFrame:CGRectMake(305,278,80,24)];
        [contactString setFont:[CPFont fontWithName:@"Trebuchet MS" size:9]];
        [self addSubview:contactString];

        [[CPNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(reloadListView:)
                                                     name:@"ContactListDidUpdate"
                                                   object:nil];
    }
    return self;
}

- (void)drawRect:(CPRect)aRect
{
    [[CPColor colorWithHexString:@"515151"] set];

    var bounds = [self bounds],
        width  = CGRectGetWidth(bounds),
        height = CGRectGetHeight(bounds),
        path   = [CPBezierPath bezierPath];

    [path moveToPoint:CGPointMake(0,30)];
    [path lineToPoint:CGPointMake(width,30)];
    [path stroke];

    [path moveToPoint:CGPointMake(0,height-30)];
    [path lineToPoint:CGPointMake(width,height-30)];
    [path stroke];

    [CPBezierPath strokeRect:bounds];
}

- (void)viewWillDraw
{
    [contactString setStringValue: [[controller contacts] count] + @" contacts"];
}

- (void)searchStringDidApply:(id)sender
{
    if ([sender objectValue]) {
        searchResults = [controller contactsMatchingSearchString:[sender objectValue]];
        searchApplied = YES;
    } else {
        searchResults = [CPArray array];
        searchApplied = NO;
    }
    [self reloadListView:nil];
}

- (void)editButtonDidClick:(id)sender
{
    if ([contactView isEditable]) {
        [editButton setTextColor:defaultColor];
        [contactView setEditable:NO];
    } else {
        [editButton setTextColor:highlightColor];
        [contactView setEditable:YES];
    }
}

- (void)addButtonDidClick:(id)sender
{
    if (searchApplied) {
        alert('Please cancel your current search to add new contacts.')
    } else {
        [controller addContact];
        [self setSelectedContactIndex:0];
        [editButton setTextColor:highlightColor];
        [contactView setEditable:YES];
    }
}

- (void)removeButtonDidClick:(id)sender
{
    if (searchApplied) {
        alert('Please cancel your current search to remove contacts.')
    } else {
        var index = [self selectedContactIndex];
        [controller removeContactAtIndex:index];
    }
}

- (int)selectedContactIndex
{
    return [[listView selectedRowIndexes] firstIndex];
}

- (void)setSelectedContactIndex:(int)anIndex
{
    [listView selectRowIndexes:[CPIndexSet indexSetWithIndex:anIndex] byExtendingSelection:NO];
    [listView scrollRowToVisible:anIndex];
}

- (void)setCurrentContact:(id)aContact
{
    if (aContact != [contactView contact]) {
        if (aContact) {
            [contactView setContact:aContact];
        } else {
            [contactView clear];
        }
        [editButton setTextColor:defaultColor];
    }
}

- (void)reloadListView:(id)sender
{
    [listView reloadData];

    if ([sender userInfo]) {
        [self setSelectedContactIndex:[[sender userInfo] objectForKey:@"index"]];
    }

    if (searchApplied) {
        [self setCurrentContact:searchResults[[self selectedContactIndex]]];
    } else {
        [self setCurrentContact:[controller contacts][[self selectedContactIndex]]];
    }
    [self setNeedsDisplay:YES];
}

// TableView delegate methods
- (int)numberOfRowsInTableView:(CPTableView)aTableView
{
    if (searchApplied) {
        return [searchResults count];
    } else {
        return [[controller contacts] count];
    }
}

- (id)tableView:(CPTableView)aTableView objectValueForTableColumn:(CPTableColumn)aColumn row:(int)aRow
{
    if (searchApplied) {
        return [searchResults[aRow] name];
    } else {
        return [[controller contacts][aRow] name];
    }
}

- (void)tableViewSelectionDidChange:(CPEvent)anEvent
{
    var index = [self selectedContactIndex];
    if (index > -1) {
        if (searchApplied) {
            [self setCurrentContact:searchResults[index]];
        } else {
            [self setCurrentContact:[controller contacts][index]];
        }
    }
}

@end
