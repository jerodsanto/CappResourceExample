@STATIC;1.0;u;21;Resources/spinner.gif58;mhtml:IE7.environment/AddressBook.sj!Resources/spinner.gifp;15;AppController.jI;21;Foundation/CPObject.ji;20;ContactsController.ji;10;BookView.ji;8;JSLink.jc;1933;
var _1=objj_allocateClassPair(CPObject,"AppController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("contactsController"),new objj_ivar("bookView")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("applicationDidFinishLaunching:"),function(_3,_4,_5){
with(_3){
var _6=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",CGRectMakeZero(),CPBorderlessBridgeWindowMask),_7=objj_msgSend(_6,"contentView"),_8=objj_msgSend(_7,"bounds"),_9=CGRectGetWidth(_8),_a=CGRectGetHeight(_8);
contactsController=objj_msgSend(objj_msgSend(ContactsController,"alloc"),"init");
objj_msgSend(contactsController,"getContacts");
var _b=objj_msgSend(objj_msgSend(CPView,"alloc"),"initWithFrame:",CGRectMake(0,0,500,330));
objj_msgSend(_b,"setAutoresizingMask:",CPViewMinXMargin|CPViewMinYMargin|CPViewMaxXMargin|CPViewMaxYMargin);
bookView=objj_msgSend(objj_msgSend(BookView,"alloc"),"initWithFrame:controller:",CGRectMake(0,0,500,300),contactsController);
objj_msgSend(_b,"addSubview:",bookView);
var _c=objj_msgSend(objj_msgSend(JSMetaText,"alloc"),"initWithFrame:title:",CGRectMake(260,308,35,20),"A little");
objj_msgSend(_b,"addSubview:",_c);
var _d=objj_msgSend(objj_msgSend(JSLink,"alloc"),"initWithFrame:title:url:",CGRectMake(295,308,85,20),"CappuccinoResource","http://github.com/sant0sk1/CappuccinoResource");
objj_msgSend(_b,"addSubview:",_d);
var _e=objj_msgSend(objj_msgSend(JSMetaText,"alloc"),"initWithFrame:title:",CGRectMake(380,308,70,20),"example app by");
objj_msgSend(_b,"addSubview:",_e);
var by=objj_msgSend(objj_msgSend(JSLink,"alloc"),"initWithFrame:title:url:",CGRectMake(450,308,50,20),"Jerod Santo","http://jerodsanto.net");
objj_msgSend(_b,"addSubview:",by);
objj_msgSend(_7,"addSubview:",_b);
objj_msgSend(_b,"setCenter:",objj_msgSend(_7,"center"));
objj_msgSend(_6,"orderFront:",_3);
}
})]);
p;10;BookView.jI;15;AppKit/CPView.ji;13;ContactView.jc;8238;
var _1=objj_msgSend(CPColor,"colorWithHexString:","4F4F4F"),_2=objj_msgSend(CPColor,"colorWithHexString:","0086F0");
var _3=objj_allocateClassPair(CPView,"BookView"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("controller"),new objj_ivar("searchField"),new objj_ivar("searchApplied"),new objj_ivar("searchResults"),new objj_ivar("contactView"),new objj_ivar("listScrollView"),new objj_ivar("theListView"),new objj_ivar("addButton"),new objj_ivar("editButton"),new objj_ivar("removeButton"),new objj_ivar("contactString")]);
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_3,[new objj_method(sel_getUid("initWithFrame:controller:"),function(_5,_6,_7,_8){
with(_5){
if(_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPView")},"initWithFrame:",_7)){
objj_msgSend(_5,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithHexString:","bababa"));
controller=_8;
searchApplied=NO;
var _9=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(210,2,80,30));
objj_msgSend(_9,"setStringValue:","Address Book");
objj_msgSend(_9,"setFont:",objj_msgSend(CPFont,"fontWithName:size:","Trebuchet MS",11.5));
objj_msgSend(_5,"addSubview:",_9);
searchField=objj_msgSend(objj_msgSend(CPSearchField,"alloc"),"initWithFrame:",CGRectMake(365,10,130,30));
objj_msgSend(searchField,"setTarget:",_5);
objj_msgSend(searchField,"setAction:",sel_getUid("searchStringDidApply:"));
objj_msgSend(_5,"addSubview:",searchField);
var _a=objj_msgSend(objj_msgSend(CPTableColumn,"alloc"),"initWithIdentifier:","name");
objj_msgSend(_a,"setWidth:",160);
listView=objj_msgSend(objj_msgSend(CPTableView,"alloc"),"initWithFrame:",CGRectMake(0,0,160,230));
objj_msgSend(listView,"setHeaderView:",nil);
objj_msgSend(listView,"setCornerView:",nil);
objj_msgSend(listView,"addTableColumn:",_a);
objj_msgSend(listView,"setDelegate:",_5);
objj_msgSend(listView,"setDataSource:",_5);
listScrollView=objj_msgSend(objj_msgSend(CPScrollView,"alloc"),"initWithFrame:",CGRectMake(1,40,175,230));
objj_msgSend(listScrollView,"setBackgroundColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(listScrollView,"setHasHorizontalScroller:",NO);
objj_msgSend(listScrollView,"setAutohidesScrollers:",YES);
objj_msgSend(listScrollView,"setDocumentView:",listView);
objj_msgSend(_5,"addSubview:",listScrollView);
contactView=objj_msgSend(objj_msgSend(ContactView,"alloc"),"initWithFrame:",CGRectMake(175,40,324,230));
objj_msgSend(contactView,"setBackgroundColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(_5,"addSubview:",contactView);
addButton=objj_msgSend(CPButton,"buttonWithTitle:","+");
objj_msgSend(addButton,"setFrame:",CGRectMake(5,273,20,24));
objj_msgSend(addButton,"setTarget:",_5);
objj_msgSend(addButton,"setAction:",sel_getUid("addButtonDidClick:"));
objj_msgSend(_5,"addSubview:",addButton);
removeButton=objj_msgSend(CPButton,"buttonWithTitle:","-");
objj_msgSend(removeButton,"setFrame:",CGRectMake(29,273,20,24));
objj_msgSend(removeButton,"setTarget:",_5);
objj_msgSend(removeButton,"setAction:",sel_getUid("removeButtonDidClick:"));
objj_msgSend(_5,"addSubview:",removeButton);
editButton=objj_msgSend(CPButton,"buttonWithTitle:","Edit");
objj_msgSend(editButton,"setFrame:",CGRectMake(175,273,50,24));
objj_msgSend(editButton,"setTarget:",_5);
objj_msgSend(editButton,"setAction:",sel_getUid("editButtonDidClick:"));
objj_msgSend(_5,"addSubview:",editButton);
contactString=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(305,278,80,24));
objj_msgSend(contactString,"setFont:",objj_msgSend(CPFont,"fontWithName:size:","Trebuchet MS",9));
objj_msgSend(_5,"addSubview:",contactString);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_5,sel_getUid("reloadListView:"),"ContactListDidUpdate",nil);
}
return _5;
}
}),new objj_method(sel_getUid("drawRect:"),function(_b,_c,_d){
with(_b){
objj_msgSend(objj_msgSend(CPColor,"colorWithHexString:","515151"),"set");
var _e=objj_msgSend(_b,"bounds"),_f=CGRectGetWidth(_e),_10=CGRectGetHeight(_e),_11=objj_msgSend(CPBezierPath,"bezierPath");
objj_msgSend(_11,"moveToPoint:",CGPointMake(0,40));
objj_msgSend(_11,"lineToPoint:",CGPointMake(_f,40));
objj_msgSend(_11,"stroke");
objj_msgSend(_11,"moveToPoint:",CGPointMake(0,_10-30));
objj_msgSend(_11,"lineToPoint:",CGPointMake(_f,_10-30));
objj_msgSend(_11,"stroke");
objj_msgSend(CPBezierPath,"strokeRect:",_e);
}
}),new objj_method(sel_getUid("viewWillDraw"),function(_12,_13){
with(_12){
objj_msgSend(contactString,"setStringValue:",objj_msgSend(objj_msgSend(controller,"contacts"),"count")+" contacts");
}
}),new objj_method(sel_getUid("searchStringDidApply:"),function(_14,_15,_16){
with(_14){
if(objj_msgSend(_16,"objectValue")){
searchResults=objj_msgSend(controller,"contactsMatchingSearchString:",objj_msgSend(_16,"objectValue"));
searchApplied=YES;
}else{
searchResults=objj_msgSend(CPArray,"array");
searchApplied=NO;
}
objj_msgSend(_14,"reloadListView:",nil);
}
}),new objj_method(sel_getUid("editButtonDidClick:"),function(_17,_18,_19){
with(_17){
if(objj_msgSend(contactView,"isEditable")){
objj_msgSend(editButton,"setTextColor:",_1);
objj_msgSend(contactView,"setEditable:",NO);
}else{
objj_msgSend(editButton,"setTextColor:",_2);
objj_msgSend(contactView,"setEditable:",YES);
}
}
}),new objj_method(sel_getUid("addButtonDidClick:"),function(_1a,_1b,_1c){
with(_1a){
if(searchApplied){
alert("Please cancel your current search to add new contacts.");
}else{
objj_msgSend(controller,"addContact");
objj_msgSend(_1a,"setSelectedContactIndex:",0);
objj_msgSend(editButton,"setTextColor:",_2);
objj_msgSend(contactView,"setEditable:",YES);
}
}
}),new objj_method(sel_getUid("removeButtonDidClick:"),function(_1d,_1e,_1f){
with(_1d){
if(searchApplied){
alert("Please cancel your current search to remove contacts.");
}else{
if(objj_msgSend(objj_msgSend(controller,"contacts"),"count")>15){
var _20=objj_msgSend(_1d,"selectedContactIndex");
objj_msgSend(controller,"removeContactAtIndex:",_20);
}else{
alert("Sorry. Have to keep a few contacts in the address book for others.");
}
}
}
}),new objj_method(sel_getUid("selectedContactIndex"),function(_21,_22){
with(_21){
return objj_msgSend(objj_msgSend(listView,"selectedRowIndexes"),"firstIndex");
}
}),new objj_method(sel_getUid("setSelectedContactIndex:"),function(_23,_24,_25){
with(_23){
objj_msgSend(listView,"selectRowIndexes:byExtendingSelection:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_25),NO);
objj_msgSend(listView,"scrollRowToVisible:",_25);
}
}),new objj_method(sel_getUid("setCurrentContact:"),function(_26,_27,_28){
with(_26){
if(_28!=objj_msgSend(contactView,"contact")){
if(_28){
objj_msgSend(contactView,"setContact:",_28);
}else{
objj_msgSend(contactView,"clear");
}
objj_msgSend(editButton,"setTextColor:",_1);
}
}
}),new objj_method(sel_getUid("reloadListView:"),function(_29,_2a,_2b){
with(_29){
objj_msgSend(listView,"reloadData");
if(objj_msgSend(_2b,"userInfo")){
objj_msgSend(_29,"setSelectedContactIndex:",objj_msgSend(objj_msgSend(_2b,"userInfo"),"objectForKey:","index"));
}
if(searchApplied){
objj_msgSend(_29,"setCurrentContact:",searchResults[objj_msgSend(_29,"selectedContactIndex")]);
}else{
objj_msgSend(_29,"setCurrentContact:",objj_msgSend(controller,"contacts")[objj_msgSend(_29,"selectedContactIndex")]);
}
objj_msgSend(_29,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("numberOfRowsInTableView:"),function(_2c,_2d,_2e){
with(_2c){
if(searchApplied){
return objj_msgSend(searchResults,"count");
}else{
return objj_msgSend(objj_msgSend(controller,"contacts"),"count");
}
}
}),new objj_method(sel_getUid("tableView:objectValueForTableColumn:row:"),function(_2f,_30,_31,_32,_33){
with(_2f){
if(searchApplied){
return objj_msgSend(searchResults[_33],"name");
}else{
return objj_msgSend(objj_msgSend(controller,"contacts")[_33],"name");
}
}
}),new objj_method(sel_getUid("tableViewSelectionDidChange:"),function(_34,_35,_36){
with(_34){
var _37=objj_msgSend(_34,"selectedContactIndex");
if(_37>-1){
if(searchApplied){
objj_msgSend(_34,"setCurrentContact:",searchResults[_37]);
}else{
objj_msgSend(_34,"setCurrentContact:",objj_msgSend(controller,"contacts")[_37]);
}
}
}
})]);
p;9;Contact.ji;27;CappuccinoResource/CRBase.jc;1136;
var _1=objj_allocateClassPair(CappuccinoResource,"Contact"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("name"),new objj_ivar("email"),new objj_ivar("phoneNumber")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("name"),function(_3,_4){
with(_3){
return name;
}
}),new objj_method(sel_getUid("setName:"),function(_5,_6,_7){
with(_5){
name=_7;
}
}),new objj_method(sel_getUid("email"),function(_8,_9){
with(_8){
return email;
}
}),new objj_method(sel_getUid("setEmail:"),function(_a,_b,_c){
with(_a){
email=_c;
}
}),new objj_method(sel_getUid("phoneNumber"),function(_d,_e){
with(_d){
return phoneNumber;
}
}),new objj_method(sel_getUid("setPhoneNumber:"),function(_f,_10,_11){
with(_f){
phoneNumber=_11;
}
}),new objj_method(sel_getUid("attributes"),function(_12,_13){
with(_12){
return {"contact":{"name":name,"email":email,"phone_number":phoneNumber}};
}
}),new objj_method(sel_getUid("sortByName:"),function(_14,_15,_16){
with(_14){
return objj_msgSend(objj_msgSend(_14,"name"),"compare:",objj_msgSend(_16,"name"));
}
})]);
p;17;ContactListItem.jp;20;ContactsController.jI;21;Foundation/CPObject.ji;9;Contact.jc;2505;
var _1=objj_allocateClassPair(CPObject,"ContactsController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("contacts")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("contacts"),function(_3,_4){
with(_3){
return contacts;
}
}),new objj_method(sel_getUid("setContacts:"),function(_5,_6,_7){
with(_5){
contacts=_7;
}
}),new objj_method(sel_getUid("init"),function(_8,_9){
with(_8){
if(_8=objj_msgSendSuper({receiver:_8,super_class:objj_getClass("CPObject")},"init")){
contacts=objj_msgSend(CPArray,"array");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_8,sel_getUid("updateContact:"),"ContactResourceDidUpdate",nil);
}
return _8;
}
}),new objj_method(sel_getUid("getContacts"),function(_a,_b){
with(_a){
contacts=objj_msgSend(Contact,"all");
}
}),new objj_method(sel_getUid("addContact"),function(_c,_d){
with(_c){
contact=objj_msgSend(Contact,"create:",{"name":"No Name"});
objj_msgSend(contacts,"insertObject:atIndex:",contact,0);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:","ContactListDidUpdate",_c);
}
}),new objj_method(sel_getUid("removeContactAtIndex:"),function(_e,_f,_10){
with(_e){
var _11=contacts[_10];
objj_msgSend(contacts,"removeObjectAtIndex:",_10);
objj_msgSend(_11,"destroy");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:","ContactListDidUpdate",_e);
}
}),new objj_method(sel_getUid("updateContact:"),function(_12,_13,_14){
with(_12){
var _15=objj_msgSend(_14,"object"),_16=0;
for(var i=0;i<contacts.length;++i){
if(objj_msgSend(contacts[i],"identifier")===objj_msgSend(_15,"identifier")){
contacts[i]=_15;
}
}
objj_msgSend(contacts,"sortUsingSelector:",sel_getUid("sortByName:"));
for(var i=0;i<contacts.length;++i){
if(objj_msgSend(contacts[i],"identifier")===objj_msgSend(_15,"identifier")){
_16=i;
}
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:userInfo:","ContactListDidUpdate",_12,objj_msgSend(CPDictionary,"dictionaryWithObject:forKey:",_16,"index"));
}
}),new objj_method(sel_getUid("contactsMatchingSearchString:"),function(_17,_18,_19){
with(_17){
var _1a=objj_msgSend(CPArray,"array"),_1b=new RegExp(_19,"i");
for(var i=0;i<contacts.length;++i){
if(objj_msgSend(contacts[i],"name").match(_1b)){
objj_msgSend(_1a,"addObject:",contacts[i]);
}
}
return _1a;
}
})]);
p;13;ContactView.jI;15;AppKit/CPView.jc;5195;
var _1=objj_allocateClassPair(CPView,"ContactView"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("contact"),new objj_ivar("isEditable"),new objj_ivar("contactName"),new objj_ivar("phoneTitle"),new objj_ivar("contactPhone"),new objj_ivar("emailTitle"),new objj_ivar("contactEmail")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("contact"),function(_3,_4){
with(_3){
return contact;
}
}),new objj_method(sel_getUid("setContact:"),function(_5,_6,_7){
with(_5){
contact=_7;
}
}),new objj_method(sel_getUid("isEditable"),function(_8,_9){
with(_8){
return isEditable;
}
}),new objj_method(sel_getUid("setIsEditable:"),function(_a,_b,_c){
with(_a){
isEditable=_c;
}
}),new objj_method(sel_getUid("initWithFrame:"),function(_d,_e,_f){
with(_d){
if(_d=objj_msgSendSuper({receiver:_d,super_class:objj_getClass("CPView")},"initWithFrame:",_f)){
var _10=objj_msgSend(_d,"bounds");
contactName=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(25,15,CGRectGetWidth(_10)-25,33));
objj_msgSend(contactName,"setFont:",objj_msgSend(CPFont,"fontWithName:size:","Trebuchet MS",24));
objj_msgSend(contactName,"setTarget:",_d);
objj_msgSend(contactName,"setAction:",sel_getUid("saveContact:"));
objj_msgSend(_d,"addSubview:",contactName);
phoneTitle=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(30,65,40,20));
objj_msgSend(phoneTitle,"setFont:",objj_msgSend(CPFont,"fontWithName:size:","Trebuchet MS",13));
objj_msgSend(phoneTitle,"setTextColor:",objj_msgSend(CPColor,"colorWithHexString:","b1b1b1"));
objj_msgSend(_d,"addSubview:",phoneTitle);
contactPhone=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(75,65,250,20));
objj_msgSend(contactPhone,"setFont:",objj_msgSend(CPFont,"fontWithName:size:","Trebuchet MS",13));
objj_msgSend(contactPhone,"setTarget:",_d);
objj_msgSend(contactPhone,"setAction:",sel_getUid("saveContact:"));
objj_msgSend(_d,"addSubview:",contactPhone);
emailTitle=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(31,90,40,20));
objj_msgSend(emailTitle,"setFont:",objj_msgSend(CPFont,"fontWithName:size:","Trebuchet MS",13));
objj_msgSend(emailTitle,"setTextColor:",objj_msgSend(CPColor,"colorWithHexString:","b1b1b1"));
objj_msgSend(_d,"addSubview:",emailTitle);
contactEmail=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(75,90,250,20));
objj_msgSend(contactEmail,"setFont:",objj_msgSend(CPFont,"fontWithName:size:","Trebuchet MS",13));
objj_msgSend(contactEmail,"setTarget:",_d);
objj_msgSend(contactEmail,"setAction:",sel_getUid("saveContact:"));
objj_msgSend(_d,"addSubview:",contactEmail);
isEditable=NO;
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"addObserver:selector:name:object:",_d,sel_getUid("saveContact:"),"CPTextFieldDidBlurNotification",nil);
}
return _d;
}
}),new objj_method(sel_getUid("drawRect:"),function(_11,_12,_13){
with(_11){
objj_msgSend(objj_msgSend(CPColor,"colorWithHexString:","515151"),"set");
var _14=objj_msgSend(CPBezierPath,"bezierPath");
objj_msgSend(_14,"moveToPoint:",CGPointMake(0,0));
objj_msgSend(_14,"lineToPoint:",CGPointMake(0,CGRectGetHeight(objj_msgSend(_11,"bounds"))));
objj_msgSend(_14,"stroke");
}
}),new objj_method(sel_getUid("saveContact:"),function(_15,_16,_17){
with(_15){
if(_17.isa===CPNotification){
if(objj_msgSend(objj_msgSend(_17,"object"),"className")==="CPSearchField"){
return;
}
}
var _18=NO,_19=objj_msgSend(contactName,"objectValue")||"",_1a=objj_msgSend(contactPhone,"objectValue")||"",_1b=objj_msgSend(contactEmail,"objectValue")||"";
if((contact.name||"")!=_19){
contact.name=_19;
_18=YES;
}
if((contact.phoneNumber||"")!=_1a){
contact.phoneNumber=_1a;
_18=YES;
}
if((contact.email||"")!=_1b){
contact.email=_1b;
_18=YES;
}
if(_18){
objj_msgSend(contact,"save");
}
}
}),new objj_method(sel_getUid("setContact:"),function(_1c,_1d,_1e){
with(_1c){
contact=_1e;
objj_msgSend(_1c,"setEditable:",NO);
objj_msgSend(contactName,"setStringValue:",objj_msgSend(contact,"name"));
objj_msgSend(phoneTitle,"setStringValue:","phone");
objj_msgSend(contactPhone,"setStringValue:",objj_msgSend(contact,"phoneNumber"));
objj_msgSend(emailTitle,"setStringValue:","email");
objj_msgSend(contactEmail,"setStringValue:",objj_msgSend(contact,"email"));
}
}),new objj_method(sel_getUid("clear"),function(_1f,_20){
with(_1f){
objj_msgSend(contactName,"setStringValue:","");
objj_msgSend(phoneTitle,"setStringValue:","");
objj_msgSend(contactPhone,"setStringValue:","");
objj_msgSend(emailTitle,"setStringValue:","");
objj_msgSend(contactEmail,"setStringValue:","");
}
}),new objj_method(sel_getUid("setEditable:"),function(_21,_22,_23){
with(_21){
if(contact&&_23){
isEditable=YES;
objj_msgSend(contactName,"setEditable:",YES);
objj_msgSend(contactPhone,"setEditable:",YES);
objj_msgSend(contactEmail,"setEditable:",YES);
objj_msgSend(contactName,"selectText:",_21);
}else{
isEditable=NO;
objj_msgSend(contactName,"setEditable:",NO);
objj_msgSend(contactPhone,"setEditable:",NO);
objj_msgSend(contactEmail,"setEditable:",NO);
}
objj_msgSend(_21,"setNeedsDisplay:",YES);
}
})]);
p;8;JSLink.jI;20;AppKit/CPTextField.jI;17;AppKit/CPButton.jc;1386;
var _1=objj_allocateClassPair(CPButton,"JSMetaText"),_2=_1.isa;
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:title:"),function(_3,_4,_5,_6){
with(_3){
if(_3=objj_msgSendSuper({receiver:_3,super_class:objj_getClass("CPButton")},"initWithFrame:",_5)){
objj_msgSend(_3,"setBordered:",NO);
objj_msgSend(_3,"setTitle:",_6);
objj_msgSend(_3,"setTextColor:",objj_msgSend(CPColor,"blackColor"));
objj_msgSend(_3,"setFont:",objj_msgSend(CPFont,"fontWithName:size:","Trebuchet MS",8.5));
}
return _3;
}
})]);
var _1=objj_allocateClassPair(JSMetaText,"JSLink"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("url")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("initWithFrame:title:url:"),function(_7,_8,_9,_a,_b){
with(_7){
if(_7=objj_msgSendSuper({receiver:_7,super_class:objj_getClass("JSMetaText")},"initWithFrame:title:",_9,_a)){
url=_b;
objj_msgSend(_7,"setTarget:",_7);
objj_msgSend(_7,"setAction:",sel_getUid("linkDidClick:"));
_7._DOMElement.style.cursor="pointer";
_7._DOMElement.style.textDecoration="underline";
}
return _7;
}
}),new objj_method(sel_getUid("linkDidClick:"),function(_c,_d,_e){
with(_c){
console.log("clicked");
window.open(url);
}
})]);
p;6;main.jI;23;Foundation/Foundation.jI;15;AppKit/AppKit.ji;15;AppController.jc;52;
main=function(_1,_2){
CPApplicationMain(_1,_2);
};
p;27;CappuccinoResource/CRBase.jI;21;Foundation/CPObject.ji;11;CRSupport.jc;9436;
var _1="id";
var _2=objj_allocateClassPair(CPObject,"CappuccinoResource"),_3=_2.isa;
class_addIvars(_2,[new objj_ivar("identifier"),new objj_ivar("attributeNames")]);
objj_registerClassPair(_2);
objj_addClassForBundle(_2,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_2,[new objj_method(sel_getUid("identifier"),function(_4,_5){
with(_4){
return identifier;
}
}),new objj_method(sel_getUid("setIdentifier:"),function(_6,_7,_8){
with(_6){
identifier=_8;
}
}),new objj_method(sel_getUid("attributes"),function(_9,_a){
with(_9){
var _b="This method must be declared in your subclass.";
CPLog.warn(_b);
console.log(_b);
return {};
}
}),new objj_method(sel_getUid("attributeNames"),function(_c,_d){
with(_c){
if(attributeNames){
return attributeNames;
}
attributeNames=objj_msgSend(CPArray,"array");
var _e=class_copyIvarList(objj_msgSend(_c,"class"));
for(var i=0;i<_e.length;i++){
objj_msgSend(attributeNames,"addObject:",_e[i].name);
}
return attributeNames;
}
}),new objj_method(sel_getUid("setAttributes:"),function(_f,_10,_11){
with(_f){
for(var _12 in _11){
if(_12==objj_msgSend(objj_msgSend(_f,"class"),"identifierKey")){
objj_msgSend(_f,"setIdentifier:",_11[_12].toString());
}else{
var _13=objj_msgSend(_12,"cappifiedString");
if(objj_msgSend(objj_msgSend(_f,"attributeNames"),"containsObject:",_13)){
var _14=_11[_12];
switch(typeof _14){
case "boolean":
if(_14){
objj_msgSend(_f,"setValue:forKey:",YES,_13);
}else{
objj_msgSend(_f,"setValue:forKey:",NO,_13);
}
break;
case "number":
objj_msgSend(_f,"setValue:forKey:",_14,_13);
break;
case "string":
if(_14.match(/^\d{4}-\d{2}-\d{2}$/)){
objj_msgSend(_f,"setValue:forKey:",objj_msgSend(CPDate,"dateWithDateString:",_14),_13);
}else{
if(_14.match(/^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}Z$/)){
objj_msgSend(_f,"setValue:forKey:",objj_msgSend(CPDate,"dateWithDateTimeString:",_14),_13);
}else{
objj_msgSend(_f,"setValue:forKey:",_14,_13);
}
}
break;
}
}
}
}
}
}),new objj_method(sel_getUid("save"),function(_15,_16){
with(_15){
var _17=objj_msgSend(_15,"resourceWillSave");
if(!_17){
return NO;
}
var _18=objj_msgSend(CPURLConnection,"sendSynchronousRequest:",_17);
if(_18[0]>=400){
objj_msgSend(_15,"resourceDidNotSave:",_18[1]);
return NO;
}else{
objj_msgSend(_15,"resourceDidSave:",_18[1]);
return YES;
}
}
}),new objj_method(sel_getUid("destroy"),function(_19,_1a){
with(_19){
var _1b=objj_msgSend(_19,"resourceWillDestroy");
if(!_1b){
return NO;
}
var _1c=objj_msgSend(CPURLConnection,"sendSynchronousRequest:",_1b);
if(_1c[0]==200){
objj_msgSend(_19,"resourceDidDestroy");
return YES;
}else{
return NO;
}
}
}),new objj_method(sel_getUid("resourceWillSave"),function(_1d,_1e){
with(_1d){
var _1f=objj_msgSend(_1d,"className")+"ResourceWillSave";
if(identifier){
var _20=objj_msgSend(objj_msgSend(_1d,"class"),"resourcePath")+"/"+identifier,_21=objj_msgSend(_1d,"className")+"ResourceWillUpdate";
}else{
var _20=objj_msgSend(objj_msgSend(_1d,"class"),"resourcePath"),_21=objj_msgSend(_1d,"className")+"ResourceWillCreate";
}
if(!_20){
return nil;
}
var _22=objj_msgSend(CPURLRequest,"requestJSONWithURL:",_20);
objj_msgSend(_22,"setHTTPMethod:",identifier?"PUT":"POST");
objj_msgSend(_22,"setHTTPBody:",objj_msgSend(CPString,"JSONFromObject:",objj_msgSend(_1d,"attributes")));
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",_21,_1d);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",_1f,_1d);
return _22;
}
}),new objj_method(sel_getUid("resourceDidSave:"),function(_23,_24,_25){
with(_23){
var _26=objj_msgSend(_25,"toJSON"),_27=_26[objj_msgSend(objj_msgSend(_23,"class"),"railsName")],_28=objj_msgSend(_23,"className")+"ResourceDidSave";
if(identifier){
var _29=objj_msgSend(_23,"className")+"ResourceDidUpdate";
}else{
var _29=objj_msgSend(_23,"className")+"ResourceDidCreate";
}
objj_msgSend(_23,"setAttributes:",_27);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",_29,_23);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",_28,_23);
}
}),new objj_method(sel_getUid("resourceDidNotSave:"),function(_2a,_2b,_2c){
with(_2a){
var _2d=objj_msgSend(_2a,"className")+"ResourceDidNotSave";
if(identifier){
var _2e=objj_msgSend(_2a,"className")+"ResourceDidNotUpdate";
}else{
var _2e=objj_msgSend(_2a,"className")+"ResourceDidNotCreate";
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",_2e,_2a);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",_2d,_2a);
}
}),new objj_method(sel_getUid("resourceWillDestroy"),function(_2f,_30){
with(_2f){
var _31=objj_msgSend(objj_msgSend(_2f,"class"),"resourcePath")+"/"+identifier,_32=objj_msgSend(_2f,"className")+"ResourceWillDestroy";
if(!_31){
return nil;
}
var _33=objj_msgSend(CPURLRequest,"requestJSONWithURL:",_31);
objj_msgSend(_33,"setHTTPMethod:","DELETE");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",_32,_2f);
return _33;
}
}),new objj_method(sel_getUid("resourceDidDestroy"),function(_34,_35){
with(_34){
var _36=objj_msgSend(_34,"className")+"ResourceDidDestroy";
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",_36,_34);
}
})]);
class_addMethods(_3,[new objj_method(sel_getUid("identifierKey"),function(_37,_38){
with(_37){
return _1;
}
}),new objj_method(sel_getUid("resourcePath"),function(_39,_3a){
with(_39){
return objj_msgSend(CPURL,"URLWithString:","/"+objj_msgSend(_39,"railsName")+"s");
}
}),new objj_method(sel_getUid("railsName"),function(_3b,_3c){
with(_3b){
return objj_msgSend(objj_msgSend(_3b,"className"),"railsifiedString");
}
}),new objj_method(sel_getUid("new"),function(_3d,_3e){
with(_3d){
return objj_msgSend(_3d,"new:",nil);
}
}),new objj_method(sel_getUid("new:"),function(_3f,_40,_41){
with(_3f){
var _42=objj_msgSend(objj_msgSend(_3f,"alloc"),"init");
if(!_41){
_41={};
}
objj_msgSend(_42,"setAttributes:",_41);
return _42;
}
}),new objj_method(sel_getUid("create:"),function(_43,_44,_45){
with(_43){
var _46=objj_msgSend(_43,"new:",_45);
if(objj_msgSend(_46,"save")){
return _46;
}else{
return nil;
}
}
}),new objj_method(sel_getUid("all"),function(_47,_48){
with(_47){
var _49=objj_msgSend(_47,"collectionWillLoad");
if(!_49){
return NO;
}
var _4a=objj_msgSend(CPURLConnection,"sendSynchronousRequest:",_49);
if(_4a[0]>=400){
return nil;
}else{
return objj_msgSend(_47,"collectionDidLoad:",_4a[1]);
}
}
}),new objj_method(sel_getUid("allWithParams:"),function(_4b,_4c,_4d){
with(_4b){
var _4e=objj_msgSend(_4b,"collectionWillLoad:",_4d);
var _4f=objj_msgSend(CPURLConnection,"sendSynchronousRequest:",_4e);
if(_4f[0]>=400){
return nil;
}else{
return objj_msgSend(_4b,"collectionDidLoad:",_4f[1]);
}
}
}),new objj_method(sel_getUid("find:"),function(_50,_51,_52){
with(_50){
var _53=objj_msgSend(_50,"resourceWillLoad:",_52);
if(!_53){
return NO;
}
var _54=objj_msgSend(CPURLConnection,"sendSynchronousRequest:",_53);
if(_54[0]>=400){
return nil;
}else{
return objj_msgSend(_50,"resourceDidLoad:",_54[1]);
}
}
}),new objj_method(sel_getUid("findWithParams:"),function(_55,_56,_57){
with(_55){
var _58=objj_msgSend(_55,"allWithParams:",_57);
return objj_msgSend(_58,"objectAtIndex:",0);
}
}),new objj_method(sel_getUid("resourceWillLoad:"),function(_59,_5a,_5b){
with(_59){
var _5c=objj_msgSend(_59,"resourcePath")+"/"+_5b,_5d=objj_msgSend(_59,"className")+"ResourceWillLoad";
if(!_5c){
return nil;
}
var _5e=objj_msgSend(CPURLRequest,"requestJSONWithURL:",_5c);
objj_msgSend(_5e,"setHTTPMethod:","GET");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",_5d,_59);
return _5e;
}
}),new objj_method(sel_getUid("resourceDidLoad:"),function(_5f,_60,_61){
with(_5f){
var _62=objj_msgSend(_61,"toJSON"),_63=_62[objj_msgSend(_5f,"railsName")],_64=objj_msgSend(_5f,"className")+"ResourceDidLoad",_65=objj_msgSend(_5f,"new");
objj_msgSend(_65,"setAttributes:",_63);
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",_64,_5f);
return _65;
}
}),new objj_method(sel_getUid("collectionWillLoad"),function(_66,_67){
with(_66){
return objj_msgSend(_66,"collectionWillLoad:",nil);
}
}),new objj_method(sel_getUid("collectionWillLoad:"),function(_68,_69,_6a){
with(_68){
var _6b=objj_msgSend(_68,"resourcePath"),_6c=objj_msgSend(_68,"className")+"CollectionWillLoad";
if(_6a){
if(_6a.isa&&objj_msgSend(_6a,"isKindOfClass:",CPDictionary)){
_6b+=("?"+objj_msgSend(CPString,"paramaterStringFromCPDictionary:",_6a));
}else{
_6b+=("?"+objj_msgSend(CPString,"paramaterStringFromJSON:",_6a));
}
}
if(!_6b){
return nil;
}
var _6d=objj_msgSend(CPURLRequest,"requestJSONWithURL:",_6b);
objj_msgSend(_6d,"setHTTPMethod:","GET");
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",_6c,_68);
return _6d;
}
}),new objj_method(sel_getUid("collectionDidLoad:"),function(_6e,_6f,_70){
with(_6e){
var _71=objj_msgSend(_70,"toJSON"),_72=objj_msgSend(CPArray,"array"),_73=objj_msgSend(_6e,"className")+"CollectionDidLoad";
for(var i=0;i<_71.length;i++){
var _74=_71[i];
var _75=_74[objj_msgSend(_6e,"railsName")];
objj_msgSend(_72,"addObject:",objj_msgSend(_6e,"new:",_75));
}
objj_msgSend(objj_msgSend(CPNotificationCenter,"defaultCenter"),"postNotificationName:object:",_73,_6e);
return _72;
}
})]);
p;30;CappuccinoResource/CRSupport.jI;19;Foundation/CPDate.jI;21;Foundation/CPString.jI;28;Foundation/CPURLConnection.jI;25;Foundation/CPURLRequest.jc;4159;
var _1=objj_getClass("CPDate");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPDate\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("year"),function(_3,_4){
with(_3){
return _3.getFullYear();
}
}),new objj_method(sel_getUid("month"),function(_5,_6){
with(_5){
return _5.getMonth()+1;
}
}),new objj_method(sel_getUid("day"),function(_7,_8){
with(_7){
return _7.getDate();
}
}),new objj_method(sel_getUid("toDateString"),function(_9,_a){
with(_9){
return objj_msgSend(CPString,"stringWithFormat:","%04d-%02d-%02d",objj_msgSend(_9,"year"),objj_msgSend(_9,"month"),objj_msgSend(_9,"day"));
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("dateWithDateString:"),function(_b,_c,_d){
with(_b){
return objj_msgSend(objj_msgSend(_b,"alloc"),"initWithString:",_d+" 12:00:00 +0000");
}
}),new objj_method(sel_getUid("dateWithDateTimeString:"),function(_e,_f,_10){
with(_e){
var _11=/^(\d{4}-\d{2}-\d{2})T(\d{2}:\d{2}:\d{2})Z$/,d=_10.match(new RegExp(_11)),_12=d[1]+" "+d[2]+" +0000";
return objj_msgSend(objj_msgSend(_e,"alloc"),"initWithString:",_12);
}
})]);
var _1=objj_getClass("CPString");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPString\""));
}
var _2=_1.isa;
class_addMethods(_1,[new objj_method(sel_getUid("railsifiedString"),function(_13,_14){
with(_13){
var str=_13;
var _15=str.split("::");
var _16=new RegExp("([ABCDEFGHIJKLMNOPQRSTUVWXYZ])","g");
var fb=new RegExp("^_");
for(var i=0;i<_15.length;i++){
_15[i]=_15[i].replace(_16,"_$1").replace(fb,"");
}
str=_15.join("/").toLowerCase();
return str;
}
}),new objj_method(sel_getUid("cappifiedString"),function(_17,_18){
with(_17){
var _19=_17.charAt(0).toLowerCase()+_17.substring(1);
var _1a=_19.split("_");
for(var x=1;x<_1a.length;x++){
_1a[x]=_1a[x].charAt(0).toUpperCase()+_1a[x].substring(1);
}
_19=_1a.join("");
return _19;
}
}),new objj_method(sel_getUid("toJSON"),function(_1b,_1c){
with(_1b){
var str=_1b;
try{
var obj=JSON.parse(str);
}
catch(anException){
CPLog.warn("Could not convert to JSON: "+str);
}
if(obj){
return obj;
}
}
})]);
class_addMethods(_2,[new objj_method(sel_getUid("paramaterStringFromJSON:"),function(_1d,_1e,_1f){
with(_1d){
paramsArray=objj_msgSend(CPArray,"array");
for(var _20 in _1f){
objj_msgSend(paramsArray,"addObject:",(escape(_20)+"="+escape(_1f[_20])));
}
return paramsArray.join("&");
}
}),new objj_method(sel_getUid("paramaterStringFromCPDictionary:"),function(_21,_22,_23){
with(_21){
var _24=objj_msgSend(CPArray,"array"),_25=objj_msgSend(_23,"allKeys");
for(var i=0;i<objj_msgSend(_23,"count");++i){
objj_msgSend(_24,"addObject:",(escape(_25[i])+"="+escape(objj_msgSend(_23,"valueForKey:",_25[i]))));
}
return _24.join("&");
}
})]);
var _1=objj_getClass("CPURLConnection");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPURLConnection\""));
}
var _2=_1.isa;
class_addMethods(_2,[new objj_method(sel_getUid("sendSynchronousRequest:"),function(_26,_27,_28){
with(_26){
try{
var _29=objj_request_xmlhttp();
_29.open(objj_msgSend(_28,"HTTPMethod"),objj_msgSend(objj_msgSend(_28,"URL"),"absoluteString"),NO);
var _2a=objj_msgSend(_28,"allHTTPHeaderFields"),key=nil,_2b=objj_msgSend(_2a,"keyEnumerator");
while(key=objj_msgSend(_2b,"nextObject")){
_29.setRequestHeader(key,objj_msgSend(_2a,"objectForKey:",key));
}
_29.send(objj_msgSend(_28,"HTTPBody"));
return objj_msgSend(CPArray,"arrayWithObjects:",_29.status,_29.responseText);
}
catch(anException){
}
return nil;
}
})]);
var _1=objj_getClass("CPURLRequest");
if(!_1){
objj_exception_throw(new objj_exception(OBJJClassNotFoundException,"*** Could not find definition for class \"CPURLRequest\""));
}
var _2=_1.isa;
class_addMethods(_2,[new objj_method(sel_getUid("requestJSONWithURL:"),function(_2c,_2d,_2e){
with(_2c){
var _2f=objj_msgSend(_2c,"requestWithURL:",_2e);
objj_msgSend(_2f,"setValue:forHTTPHeaderField:","application/json","Accept");
objj_msgSend(_2f,"setValue:forHTTPHeaderField:","application/json","Content-Type");
return _2f;
}
})]);
e;/*
Content-Type: multipart/related; boundary="_ANY_STRING_WILL_DO_AS_A_SEPARATOR"

--_ANY_STRING_WILL_DO_AS_A_SEPARATOR
Content-Location:Resources/spinner.gif
Content-Transfer-Encoding:base64

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
*/