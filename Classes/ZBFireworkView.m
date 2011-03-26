#import "ZBFireworkView.h"
#import "ZBFireworkLayer.h"

@implementation ZBFireworkView

- (void)dealloc 
{
    [super dealloc];
}

- (void)tap:(UIGestureRecognizer *)r
{
	CGPoint location = [r locationInView:self];
	CGFloat hue = [NSDate timeIntervalSinceReferenceDate] - floor([NSDate timeIntervalSinceReferenceDate]);
	ZBFireworkLayer *aLayer = [[[ZBFireworkLayer alloc] initWithHue:hue] autorelease];
	CGPoint from = CGPointMake(location.x, self.bounds.size.height - 50.0);
	CGPoint to = CGPointMake(location.x, (self.bounds.size.height - 100.0) * (random() % 100 / (CGFloat) 100));
	[aLayer animateInLayer:self.layer from:from to:to];
}

- (void)_init
{
	self.backgroundColor = [UIColor blackColor];
	UITapGestureRecognizer *r = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
	[self addGestureRecognizer:r];
	[r release];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self != nil) {
		[self _init];
	}
	return self;
}

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self != nil) {
		[self _init];
	}	
    return self;
}

- (void)drawRect:(CGRect)rect
{
	[super drawRect:rect];
	[[UIImage imageNamed:@"stars.jpg"] drawInRect:self.bounds];
	
	NSString *msg = @"Tap to fire!";
	CGRect textFrame = CGRectMake(10.0, 20.0, self.bounds.size.width - 20.0, 30.0);
	[[UIColor whiteColor] set];
	[msg drawInRect:textFrame withFont:[UIFont boldSystemFontOfSize:18.0] lineBreakMode:UILineBreakModeTailTruncation alignment:UITextAlignmentCenter];
	
}

- (BOOL)isAccessibilityElement
{
	return YES;
}

- (NSString *)accessibilityLabel
{
	return @"Tap to fire!";
}



@end
