@import <AppKit/CPTextField.j>
@import <AppKit/CPButton.j>

@implementation JSMetaText : CPButton

- (id)initWithFrame:(CPRect)aFrame title:(CPString)aTitle
{
    if (self = [super initWithFrame:aFrame])
    {
        [self setBordered:NO];
        [self setTitle:aTitle];
        [self setTextColor:[CPColor blackColor]];
        [self setFont:[CPFont fontWithName:@"Trebuchet MS" size:8.5]];
    }
    return self;
}

@end

@implementation JSLink : JSMetaText
{
    CPString url;
}

- (id)initWithFrame:(CPRect)aFrame title:(CPString)aTitle url:(CPString)aUrl
{
    if (self = [super initWithFrame:aFrame title:aTitle])
    {
        url = aUrl;
        [self setTarget:self];
        [self setAction:@selector(linkDidClick:)];
        self._DOMElement.style.cursor         = "pointer";
        self._DOMElement.style.textDecoration = "underline";
    }
    return self;
}

- (void)linkDidClick:(id)sender
{
    console.log('clicked');
    window.open(url);
}

@end
