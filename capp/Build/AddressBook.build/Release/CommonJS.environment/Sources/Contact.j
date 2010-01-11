i;27;CappuccinoResource/CRBase.jc;1136;
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
