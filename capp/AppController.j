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
@import "JSLink.j"

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

    var containerView = [[CPView alloc] initWithFrame:CGRectMake(0,0,500,330)];
    [containerView setAutoresizingMask:CPViewMinXMargin|CPViewMinYMargin|CPViewMaxXMargin|CPViewMaxYMargin];

    bookView = [[BookView alloc] initWithFrame:CGRectMake(0,0,500,300)
                                    controller:contactsController];

    [containerView addSubview:bookView];

    var aboutOne = [[JSMetaText alloc] initWithFrame:CGRectMake(260,308,35,20)
                                            title:@"A little"];
    [containerView addSubview:aboutOne];

    var link = [[JSLink alloc] initWithFrame:CGRectMake(295,308,85,20)
                                       title:@"CappuccinoResource"
                                         url:@"http://github.com/sant0sk1/CappuccinoResource"];
    [containerView addSubview:link];

    var aboutTwo = [[JSMetaText alloc] initWithFrame:CGRectMake(380,308,70,20)
                                                title:@"example app by"];
    [containerView addSubview:aboutTwo];

    var by = [[JSLink alloc] initWithFrame:CGRectMake(450,308,50,20)
                                     title:@"Jerod Santo"
                                       url:@"http://jerodsanto.net"];
    [containerView addSubview:by];

    [contentView addSubview:containerView];
    [containerView setCenter:[contentView center]];
    [theWindow orderFront:self];
}

@end
