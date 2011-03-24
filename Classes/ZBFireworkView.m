#import "ZBFireworkView.h"
#import "ZBFireworkLayer.h"

@implementation ZBFireworkView

- (void)dealloc 
{
    [super dealloc];
}

- (void)tap:(UIGestureRecognizer *)r
{
	NSLog(@"%s", __PRETTY_FUNCTION__);
	CGPoint location = [r locationInView:self];
	CGFloat hue = ((NSInteger)[NSDate timeIntervalSinceReferenceDate] % 10) / (CGFloat)10;
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


@end
