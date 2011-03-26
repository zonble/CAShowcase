#import "ZBPathView.h"

@implementation ZBPathView

- (void)dealloc
{
	CGPathRelease(path);
	[spot release];
    [super dealloc];
}

- (void)_init
{
	self.backgroundColor = [UIColor whiteColor];
	path = CGPathCreateMutable();
	CGPathMoveToPoint(path, NULL, 20.0, 40.0);
	for (NSUInteger i = 0; i < 10; i++) {
		CGFloat x = (i % 2) ? 20.0 : self.bounds.size.width - 20.0;
		CGFloat y = 40.0 + 30.0 * (i + 1);
//		CGPathAddLineToPoint(path, NULL, x, y);
		CGPathAddArcToPoint(path, NULL, x, y, x, y + 20.0, 10.0);
	}
	spot = [[ZBLayoutLayer alloc] init];
	spot.bounds = CGRectMake(0.0, 0.0, 30.0, 30.0);
	spot.color = [UIColor redColor];
	[self.layer addSublayer:spot];
	
	CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
	animation.duration = 5.0;
	animation.path = path;
	animation.repeatCount = NSUIntegerMax;
	animation.autoreverses = YES;
	animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
	[spot addAnimation:animation forKey:@"move"];
	
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
	 CGContextRef ctx = UIGraphicsGetCurrentContext();
	 CGColorSpaceRef rgbColor = CGColorSpaceCreateDeviceRGB();
	 CGFloat black[4] = {0.0, 0.0, 0.0, 1.0};
	 CGContextSetLineWidth(ctx, 2.0);
	 CGContextSetStrokeColorSpace(ctx, rgbColor);
	 CGContextSetStrokeColor(ctx, black);
	 CGContextAddPath(ctx, path);	 
	 CGContextStrokePath(ctx);
	 CGColorSpaceRelease(rgbColor);
 }


@end
