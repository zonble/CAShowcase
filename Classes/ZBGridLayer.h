#import <QuartzCore/QuartzCore.h>

@interface ZBGridLayer : CALayer 
{
    UIImage *image;
	NSString *title;
	UIAccessibilityElement *element;
	UIView *view;
}

@property (retain, nonatomic) NSString *title;
@property (retain, nonatomic) UIImage *image;
@property (readonly) UIAccessibilityElement *element;
@property (assign, nonatomic) UIView *view;

@end
