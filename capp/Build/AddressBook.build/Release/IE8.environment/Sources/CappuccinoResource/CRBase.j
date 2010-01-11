I;21;Foundation/CPObject.ji;11;CRSupport.jc;9436;
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
