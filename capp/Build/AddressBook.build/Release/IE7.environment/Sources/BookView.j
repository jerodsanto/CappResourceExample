I;15;AppKit/CPView.ji;13;ContactView.jc;7917;
var _1=objj_msgSend(CPColor,"colorWithHexString:","4F4F4F"),_2=objj_msgSend(CPColor,"colorWithHexString:","0086F0");
var _3=objj_allocateClassPair(CPView,"BookView"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("controller"),new objj_ivar("searchField"),new objj_ivar("searchApplied"),new objj_ivar("searchResults"),new objj_ivar("contactView"),new objj_ivar("listScrollView"),new objj_ivar("theListView"),new objj_ivar("addButton"),new objj_ivar("editButton"),new objj_ivar("removeButton"),new objj_ivar("contactString")]);
objj_registerClassPair(_3);
objj_addClassForBundle(_3,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_3,[new objj_method(sel_getUid("initWithFrame:controller:"),function(_5,_6,_7,_8){
with(_5){
if(_5=objj_msgSendSuper({receiver:_5,super_class:objj_getClass("CPView")},"initWithFrame:",_7)){
objj_msgSend(_5,"setBackgroundColor:",objj_msgSend(CPColor,"colorWithHexString:","bababa"));
objj_msgSend(_5,"setAutoresizingMask:",CPViewMinXMargin|CPViewMinYMargin|CPViewMaxXMargin|CPViewMaxYMargin);
controller=_8;
searchApplied=NO;
searchField=objj_msgSend(objj_msgSend(CPSearchField,"alloc"),"initWithFrame:",CGRectMake(365,0,130,30));
objj_msgSend(searchField,"setTarget:",_5);
objj_msgSend(searchField,"setAction:",sel_getUid("searchStringDidApply:"));
objj_msgSend(_5,"addSubview:",searchField);
var _9=objj_msgSend(objj_msgSend(CPTableColumn,"alloc"),"initWithIdentifier:","name");
objj_msgSend(_9,"setWidth:",160);
listView=objj_msgSend(objj_msgSend(CPTableView,"alloc"),"initWithFrame:",CGRectMake(0,0,160,240));
objj_msgSend(listView,"setHeaderView:",nil);
objj_msgSend(listView,"setCornerView:",nil);
objj_msgSend(listView,"addTableColumn:",_9);
objj_msgSend(listView,"setDelegate:",_5);
objj_msgSend(listView,"setDataSource:",_5);
listScrollView=objj_msgSend(objj_msgSend(CPScrollView,"alloc"),"initWithFrame:",CGRectMake(1,30,175,240));
objj_msgSend(listScrollView,"setBackgroundColor:",objj_msgSend(CPColor,"whiteColor"));
objj_msgSend(listScrollView,"setHasHorizontalScroller:",NO);
objj_msgSend(listScrollView,"setAutohidesScrollers:",YES);
objj_msgSend(listScrollView,"setDocumentView:",listView);
objj_msgSend(_5,"addSubview:",listScrollView);
contactView=objj_msgSend(objj_msgSend(ContactView,"alloc"),"initWithFrame:",CGRectMake(175,30,324,240));
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
}),new objj_method(sel_getUid("drawRect:"),function(_a,_b,_c){
with(_a){
objj_msgSend(objj_msgSend(CPColor,"colorWithHexString:","515151"),"set");
var _d=objj_msgSend(_a,"bounds"),_e=CGRectGetWidth(_d),_f=CGRectGetHeight(_d),_10=objj_msgSend(CPBezierPath,"bezierPath");
objj_msgSend(_10,"moveToPoint:",CGPointMake(0,30));
objj_msgSend(_10,"lineToPoint:",CGPointMake(_e,30));
objj_msgSend(_10,"stroke");
objj_msgSend(_10,"moveToPoint:",CGPointMake(0,_f-30));
objj_msgSend(_10,"lineToPoint:",CGPointMake(_e,_f-30));
objj_msgSend(_10,"stroke");
objj_msgSend(CPBezierPath,"strokeRect:",_d);
}
}),new objj_method(sel_getUid("viewWillDraw"),function(_11,_12){
with(_11){
objj_msgSend(contactString,"setStringValue:",objj_msgSend(objj_msgSend(controller,"contacts"),"count")+" contacts");
}
}),new objj_method(sel_getUid("searchStringDidApply:"),function(_13,_14,_15){
with(_13){
if(objj_msgSend(_15,"objectValue")){
searchResults=objj_msgSend(controller,"contactsMatchingSearchString:",objj_msgSend(_15,"objectValue"));
searchApplied=YES;
}else{
searchResults=objj_msgSend(CPArray,"array");
searchApplied=NO;
}
objj_msgSend(_13,"reloadListView:",nil);
}
}),new objj_method(sel_getUid("editButtonDidClick:"),function(_16,_17,_18){
with(_16){
if(objj_msgSend(contactView,"isEditable")){
objj_msgSend(editButton,"setTextColor:",_1);
objj_msgSend(contactView,"setEditable:",NO);
}else{
objj_msgSend(editButton,"setTextColor:",_2);
objj_msgSend(contactView,"setEditable:",YES);
}
}
}),new objj_method(sel_getUid("addButtonDidClick:"),function(_19,_1a,_1b){
with(_19){
if(searchApplied){
alert("Please cancel your current search to add new contacts.");
}else{
objj_msgSend(controller,"addContact");
objj_msgSend(_19,"setSelectedContactIndex:",0);
objj_msgSend(editButton,"setTextColor:",_2);
objj_msgSend(contactView,"setEditable:",YES);
}
}
}),new objj_method(sel_getUid("removeButtonDidClick:"),function(_1c,_1d,_1e){
with(_1c){
if(searchApplied){
alert("Please cancel your current search to remove contacts.");
}else{
var _1f=objj_msgSend(_1c,"selectedContactIndex");
objj_msgSend(controller,"removeContactAtIndex:",_1f);
}
}
}),new objj_method(sel_getUid("selectedContactIndex"),function(_20,_21){
with(_20){
return objj_msgSend(objj_msgSend(listView,"selectedRowIndexes"),"firstIndex");
}
}),new objj_method(sel_getUid("setSelectedContactIndex:"),function(_22,_23,_24){
with(_22){
objj_msgSend(listView,"selectRowIndexes:byExtendingSelection:",objj_msgSend(CPIndexSet,"indexSetWithIndex:",_24),NO);
objj_msgSend(listView,"scrollRowToVisible:",_24);
}
}),new objj_method(sel_getUid("setCurrentContact:"),function(_25,_26,_27){
with(_25){
if(_27!=objj_msgSend(contactView,"contact")){
if(_27){
objj_msgSend(contactView,"setContact:",_27);
}else{
objj_msgSend(contactView,"clear");
}
objj_msgSend(editButton,"setTextColor:",_1);
}
}
}),new objj_method(sel_getUid("reloadListView:"),function(_28,_29,_2a){
with(_28){
objj_msgSend(listView,"reloadData");
if(objj_msgSend(_2a,"userInfo")){
objj_msgSend(_28,"setSelectedContactIndex:",objj_msgSend(objj_msgSend(_2a,"userInfo"),"objectForKey:","index"));
}
if(searchApplied){
objj_msgSend(_28,"setCurrentContact:",searchResults[objj_msgSend(_28,"selectedContactIndex")]);
}else{
objj_msgSend(_28,"setCurrentContact:",objj_msgSend(controller,"contacts")[objj_msgSend(_28,"selectedContactIndex")]);
}
objj_msgSend(_28,"setNeedsDisplay:",YES);
}
}),new objj_method(sel_getUid("numberOfRowsInTableView:"),function(_2b,_2c,_2d){
with(_2b){
if(searchApplied){
return objj_msgSend(searchResults,"count");
}else{
return objj_msgSend(objj_msgSend(controller,"contacts"),"count");
}
}
}),new objj_method(sel_getUid("tableView:objectValueForTableColumn:row:"),function(_2e,_2f,_30,_31,_32){
with(_2e){
if(searchApplied){
return objj_msgSend(searchResults[_32],"name");
}else{
return objj_msgSend(objj_msgSend(controller,"contacts")[_32],"name");
}
}
}),new objj_method(sel_getUid("tableViewSelectionDidChange:"),function(_33,_34,_35){
with(_33){
var _36=objj_msgSend(_33,"selectedContactIndex");
if(_36>-1){
if(searchApplied){
objj_msgSend(_33,"setCurrentContact:",searchResults[_36]);
}else{
objj_msgSend(_33,"setCurrentContact:",objj_msgSend(controller,"contacts")[_36]);
}
}
}
})]);
