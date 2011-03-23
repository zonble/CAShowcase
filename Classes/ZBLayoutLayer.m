#import "ZBLayoutLayer.h"

@implementation ZBLayoutLayer

- (void)dealloc
{
	[color release];
	[super dealloc];
}

- (id)init
{
	self = [super init];
	if (self != nil) {
		self.color = [UIColor whiteColor];
	}
	return self;
}

- (void)drawInContext:(CGContextRef)ctx
{
	UIGraphicsPushContext(ctx);
	[color setFill];
	UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:self.bounds];
	[path fill];
	UIGraphicsPopContext();
}

- (void)setBounds:(CGRect)inBounds
{
	[super setBounds:inBounds];
	[self setNeedsDisplay];
}

@synthesize color;

@end
