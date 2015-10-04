#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface UIView (Screenshot)

@property (NS_NONATOMIC_IOSONLY, readonly, strong) UIImage *screenshot;
@property (NS_NONATOMIC_IOSONLY, readonly, strong) UIImage *invertedScreenshot;

@end
