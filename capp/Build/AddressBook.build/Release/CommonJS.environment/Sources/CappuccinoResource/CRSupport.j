I;19;Foundation/CPDate.jI;21;Foundation/CPString.jI;28;Foundation/CPURLConnection.jI;25;Foundation/CPURLRequest.jc;4159;
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
