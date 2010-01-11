@import "CappuccinoResource/CRBase.j"

@implementation Contact : CappuccinoResource
{
    CPString name           @accessors;
    CPString email          @accessors;
    CPString phoneNumber    @accessors;
}

- (JSObject)attributes
{
    return {"contact":{"name":name, "email":email, "phone_number":phoneNumber}};
}

- (CPSortDescriptor)sortByName:(Object)other
{
    return [[self name] compare:[other name]];
}

@end
