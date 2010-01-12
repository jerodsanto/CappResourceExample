@import <AppKit/CPView.j>


@implementation ContactView : CPView
{
    Contact     contact         @accessors;
    BOOL        isEditable      @accessors;
    CPTextField contactName;
    CPTextField phoneTitle;
    CPTextField contactPhone;
    CPTextField emailTitle;
    CPTextField contactEmail;
}

- (id)initWithFrame:(CPRect)aFrame
{
    if(self = [super initWithFrame:aFrame])
    {
        var bounds = [self bounds];

        contactName = [[CPTextField alloc] initWithFrame:CGRectMake(25,15,CGRectGetWidth(bounds)-25,33)];
        [contactName setFont:[CPFont fontWithName:@"Trebuchet MS" size:24]];
        [contactName setTarget:self];
        [contactName setAction:@selector(saveContact:)];
        [self addSubview:contactName];

        phoneTitle = [[CPTextField alloc] initWithFrame:CGRectMake(30,65,40,20)];
        [phoneTitle setFont:[CPFont fontWithName:@"Trebuchet MS" size:13]];
        [phoneTitle setTextColor:[CPColor colorWithHexString:@"b1b1b1"]];
        [self addSubview:phoneTitle];

        contactPhone = [[CPTextField alloc] initWithFrame:CGRectMake(75,65,250,20)];
        [contactPhone setFont:[CPFont fontWithName:@"Trebuchet MS" size:13]];
        [contactPhone setTarget:self];
        [contactPhone setAction:@selector(saveContact:)];
        [self addSubview:contactPhone];

        emailTitle = [[CPTextField alloc] initWithFrame:CGRectMake(31,90,40,20)];
        [emailTitle setFont:[CPFont fontWithName:@"Trebuchet MS" size:13]];
        [emailTitle setTextColor:[CPColor colorWithHexString:@"b1b1b1"]];
        [self addSubview:emailTitle];

        contactEmail = [[CPTextField alloc] initWithFrame:CGRectMake(75,90,250,20)];
        [contactEmail setFont:[CPFont fontWithName:@"Trebuchet MS" size:13]];
        [contactEmail setTarget:self];
        [contactEmail setAction:@selector(saveContact:)];
        [self addSubview:contactEmail];

        isEditable = NO;

        [[CPNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(saveContact:)
                                                     name:@"CPTextFieldDidBlurNotification"
                                                   object:nil];
    }
    return self;
}

- (void)drawRect:(CPRect)aRect
{
    [[CPColor colorWithHexString:@"515151"] set];

    var path = [CPBezierPath bezierPath];

    [path moveToPoint:CGPointMake(0,0)];
    [path lineToPoint:CGPointMake(0,CGRectGetHeight([self bounds]))];
    [path stroke];
}

- (void)saveContact:(id)sender
{
    if (sender.isa === CPNotification) {
        if ([[sender object] className] === "CPSearchField") {
            return;
        }
    }

    var attributesChanged = NO,
        name              = [contactName objectValue]  || "",
        phone             = [contactPhone objectValue] || "",
        email             = [contactEmail objectValue] || "";

    if ((contact.name || "") != name) {
        contact.name = name;
        attributesChanged = YES;
    }

    if ((contact.phoneNumber || "") != phone) {
        contact.phoneNumber = phone;
        attributesChanged = YES;
    }

    if ((contact.email || "") != email) {
        contact.email = email;
        attributesChanged = YES;
    }

    if (attributesChanged) {
        [contact save];
    }
}

- (void)setContact:(id)aContact
{
    contact = aContact;
    [self setEditable:NO];
    [contactName setStringValue:[contact name]];
    [phoneTitle setStringValue:@"phone"];
    [contactPhone setStringValue:[contact phoneNumber]];
    [emailTitle setStringValue:@"email"];
    [contactEmail setStringValue:[contact email]];
}

- (void)clear
{
    [contactName setStringValue:@""];
    [phoneTitle setStringValue:@""];
    [contactPhone setStringValue:@""];
    [emailTitle setStringValue:@""];
    [contactEmail setStringValue:@""];
}

- (void)setEditable:(BOOL)shouldEdit
{
    if (contact && shouldEdit) {
        isEditable = YES;
        [contactName setEditable:YES];
        [contactPhone setEditable:YES];
        [contactEmail setEditable:YES];
        [contactName selectText:self];
    } else {
        isEditable = NO;
        [contactName setEditable:NO];
        [contactPhone setEditable:NO];
        [contactEmail setEditable:NO];
    }
    [self setNeedsDisplay:YES];
}

@end
