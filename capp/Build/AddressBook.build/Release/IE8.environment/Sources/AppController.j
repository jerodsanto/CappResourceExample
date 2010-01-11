I;21;Foundation/CPObject.ji;20;ContactsController.ji;10;BookView.jc;1012;
var _1=objj_allocateClassPair(CPObject,"AppController"),_2=_1.isa;
class_addIvars(_1,[new objj_ivar("contactsController"),new objj_ivar("bookView")]);
objj_registerClassPair(_1);
objj_addClassForBundle(_1,objj_getBundleWithPath(OBJJ_CURRENT_BUNDLE.path));
class_addMethods(_1,[new objj_method(sel_getUid("applicationDidFinishLaunching:"),function(_3,_4,_5){
with(_3){
var _6=objj_msgSend(objj_msgSend(CPWindow,"alloc"),"initWithContentRect:styleMask:",CGRectMakeZero(),CPBorderlessBridgeWindowMask),_7=objj_msgSend(_6,"contentView"),_8=objj_msgSend(_7,"bounds"),_9=CGRectGetWidth(_8),_a=CGRectGetHeight(_8);
contactsController=objj_msgSend(objj_msgSend(ContactsController,"alloc"),"init");
objj_msgSend(contactsController,"getContacts");
bookView=objj_msgSend(objj_msgSend(BookView,"alloc"),"initWithFrame:controller:",CGRectMake(0,0,500,300),contactsController);
objj_msgSend(_7,"addSubview:",bookView);
objj_msgSend(bookView,"setCenter:",objj_msgSend(_7,"center"));
objj_msgSend(_6,"orderFront:",_3);
}
})]);
