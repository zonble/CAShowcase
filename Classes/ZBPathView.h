#import <QuartzCore/QuartzCore.h>
#import "ZBLayoutLayer.h"

@interface ZBPathView : UIView 
{
	ZBLayoutLayer *spot;
    CGMutablePathRef path;
}

@end
