#import <QuartzCore/QuartzCore.h>

@interface ZBGridLayer : CALayer
{
	UIImage *image;
	NSString *title;
	UIAccessibilityElement *element;
	UIView *view;
}

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) UIImage *image;
@property (readonly) UIAccessibilityElement *element;
@property (weak, nonatomic) UIView *view;

@end
