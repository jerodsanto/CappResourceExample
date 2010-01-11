@import <Foundation/CPObject.j>
@import "Contact.j"

@implementation ContactsController : CPObject
{
    CPArray contacts @accessors;
}

- (id)init
{
    if(self = [super init])
    {
        contacts = [CPArray array];

        [[CPNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(updateContact:)
                                                     name:@"ContactResourceDidUpdate"
                                                   object:nil];
    }
    return self;
}

- (void)getContacts
{
    contacts = [Contact all];
}

- (void)addContact
{
    contact = [Contact create:{"name":"No Name"}];
    [contacts insertObject:contact atIndex:0];
    [[CPNotificationCenter defaultCenter] postNotificationName:@"ContactListDidUpdate"
                                                        object:self];
}

- (void)removeContactAtIndex:(int)anIndex
{
    var contact = contacts[anIndex];
    [contacts removeObjectAtIndex:anIndex];
    [contact destroy];
    [[CPNotificationCenter defaultCenter] postNotificationName:@"ContactListDidUpdate"
                                                        object:self];
}

- (void)updateContact:(id)sender
{
    var contact  = [sender object],
        newIndex = 0;

    for (var i = 0; i < contacts.length; ++i) {
        if ([contacts[i] identifier] === [contact identifier]) {
            contacts[i] = contact;
        }
    }

    [contacts sortUsingSelector:@selector(sortByName:)];

    for (var i = 0; i < contacts.length; ++i) {
        if ([contacts[i] identifier] === [contact identifier]) {
            newIndex = i;
        }
    }

    [[CPNotificationCenter defaultCenter] postNotificationName:@"ContactListDidUpdate"
                                                        object:self
                                                      userInfo:[CPDictionary dictionaryWithObject:newIndex
                                                                                           forKey:@"index"]];
}

- (CPArray)contactsMatchingSearchString:(CPString)aSearch
{
    var matches = [CPArray array],
        regexp  = new RegExp(aSearch, "i");

    for (var i = 0; i < contacts.length; ++i) {
        if ([contacts[i] name].match(regexp)) {
            [matches addObject:contacts[i]];
        }
    }

    return matches;
}

@end
