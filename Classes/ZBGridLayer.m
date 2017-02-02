#import "ZBGridLayer.h"

@implementation ZBGridLayer
{
	UIImage *image;
	NSString *title;
	UIAccessibilityElement *element;
	UIView *view;
}

- (instancetype)init
{
	self = [super init];
	if (self) {
		image = nil;
		title = nil;
	}
	return self;
}

- (void)drawInContext:(CGContextRef)ctx
{
	UIGraphicsPushContext(ctx);
	UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:10.0];
	CGContextSaveGState(ctx);
	CGContextAddPath(ctx, path.CGPath);
	CGContextClip(ctx);
	[image drawInRect:self.bounds];
	CGContextRestoreGState(ctx);
	UIGraphicsPopContext();
}

- (void)setImage:(UIImage *)inImage
{
	image = inImage;
	[self setNeedsDisplay];
}

- (UIImage *)image
{
	return image;
}

- (void)setView:(UIView *)inVew
{
	view = inVew;
	id tmp = element;
	element = [[UIAccessibilityElement alloc] initWithAccessibilityContainer:inVew];
	element.accessibilityTraits = UIAccessibilityTraitButton;
}

- (UIView *)view
{
	return view;
}

@synthesize title;
@synthesize element;


@end
