/*
 * AppController.j
 * AddressBook
 *
 * Created by Jerod Santo on January 9, 2010.
 * Copyright 2010, Your Company All rights reserved.
 */

@import <Foundation/CPObject.j>
@import "ContactsController.j"
@import "BookView.j"

@implementation AppController : CPObject
{
    ContactsController  contactsController;
    BookView            bookView;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    var theWindow   = [[CPWindow alloc] initWithContentRect:CGRectMakeZero()
                                                  styleMask:CPBorderlessBridgeWindowMask],
        contentView = [theWindow contentView],
        bounds      = [contentView bounds],
        width       = CGRectGetWidth(bounds),
        height      = CGRectGetHeight(bounds);

    contactsController = [[ContactsController alloc] init];
    [contactsController getContacts];

    bookView = [[BookView alloc] initWithFrame:CGRectMake(0,0,500,300)
                                    controller:contactsController];

    [contentView addSubview:bookView];
    [bookView setCenter:[contentView center]];

    [theWindow orderFront:self];
}

@end
