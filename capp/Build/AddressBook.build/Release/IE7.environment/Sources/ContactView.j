I;15;AppKit/CPView.jc;5338;
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
contactName=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(10,10,CGRectGetWidth(_10)-10,33));
objj_msgSend(contactName,"setFont:",objj_msgSend(CPFont,"fontWithName:size:","Trebuchet MS",24));
objj_msgSend(contactName,"setTarget:",_d);
objj_msgSend(contactName,"setAction:",sel_getUid("saveContact:"));
objj_msgSend(_d,"addSubview:",contactName);
phoneTitle=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(15,60,40,20));
objj_msgSend(phoneTitle,"setFont:",objj_msgSend(CPFont,"fontWithName:size:","Trebuchet MS",13));
objj_msgSend(phoneTitle,"setTextColor:",objj_msgSend(CPColor,"colorWithHexString:","b1b1b1"));
objj_msgSend(_d,"addSubview:",phoneTitle);
contactPhone=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(60,60,250,20));
objj_msgSend(contactPhone,"setFont:",objj_msgSend(CPFont,"fontWithName:size:","Trebuchet MS",13));
objj_msgSend(contactPhone,"setTarget:",_d);
objj_msgSend(contactPhone,"setAction:",sel_getUid("saveContact:"));
objj_msgSend(_d,"addSubview:",contactPhone);
emailTitle=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(16,85,40,20));
objj_msgSend(emailTitle,"setFont:",objj_msgSend(CPFont,"fontWithName:size:","Trebuchet MS",13));
objj_msgSend(emailTitle,"setTextColor:",objj_msgSend(CPColor,"colorWithHexString:","b1b1b1"));
objj_msgSend(_d,"addSubview:",emailTitle);
contactEmail=objj_msgSend(objj_msgSend(CPTextField,"alloc"),"initWithFrame:",CGRectMake(60,85,250,20));
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
var _18=NO;
if((contact.name||"")!=objj_msgSend(contactName,"objectValue")){
contact.name=objj_msgSend(contactName,"objectValue");
_18=YES;
}
if((contact.phoneNumber||"")!=objj_msgSend(contactPhone,"objectValue")){
contact.phoneNumber=objj_msgSend(contactPhone,"objectValue");
_18=YES;
}
if((contact.email||"")!=objj_msgSend(contactEmail,"objectValue")){
console.log(contact.email,objj_msgSend(contactEmail,"objectValue"));
contact.email=objj_msgSend(contactEmail,"objectValue");
_18=YES;
}
if(_18){
objj_msgSend(contact,"save");
}
}
}),new objj_method(sel_getUid("setContact:"),function(_19,_1a,_1b){
with(_19){
contact=_1b;
objj_msgSend(_19,"setEditable:",NO);
objj_msgSend(contactName,"setStringValue:",objj_msgSend(contact,"name"));
objj_msgSend(phoneTitle,"setStringValue:","phone");
objj_msgSend(contactPhone,"setStringValue:",objj_msgSend(contact,"phoneNumber"));
objj_msgSend(emailTitle,"setStringValue:","email");
objj_msgSend(contactEmail,"setStringValue:",objj_msgSend(contact,"email"));
}
}),new objj_method(sel_getUid("clear"),function(_1c,_1d){
with(_1c){
objj_msgSend(contactName,"setStringValue:","");
objj_msgSend(phoneTitle,"setStringValue:","");
objj_msgSend(contactPhone,"setStringValue:","");
objj_msgSend(emailTitle,"setStringValue:","");
objj_msgSend(contactEmail,"setStringValue:","");
}
}),new objj_method(sel_getUid("setEditable:"),function(_1e,_1f,_20){
with(_1e){
if(contact&&_20){
isEditable=YES;
objj_msgSend(contactName,"setEditable:",YES);
objj_msgSend(contactPhone,"setEditable:",YES);
objj_msgSend(contactEmail,"setEditable:",YES);
objj_msgSend(contactName,"selectText:",_1e);
}else{
isEditable=NO;
objj_msgSend(contactName,"setEditable:",NO);
objj_msgSend(contactPhone,"setEditable:",NO);
objj_msgSend(contactEmail,"setEditable:",NO);
}
objj_msgSend(_1e,"setNeedsDisplay:",YES);
}
})]);
