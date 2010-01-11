I;21;Foundation/CPObject.ji;9;Contact.jc;2505;
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
