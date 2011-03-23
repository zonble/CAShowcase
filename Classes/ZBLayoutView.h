#import <QuartzCore/QuartzCore.h>
#import "ZBLayoutLayer.h"

@interface ZBLayoutView : UIView 
{
	NSMutableArray *layers;
	UITouch *currentTouch;
	NSTimer *rotateTimer;
	NSUInteger rotateIndex;
}

@property (retain, nonatomic) UITouch *currentTouch;

@end
