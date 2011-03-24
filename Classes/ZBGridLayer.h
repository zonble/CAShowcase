#import <QuartzCore/QuartzCore.h>

@interface ZBGridLayer : CALayer 
{
    UIImage *image;
	NSString *title;
}

@property (retain, nonatomic) NSString *title;
@property (retain, nonatomic) UIImage *image;

@end
