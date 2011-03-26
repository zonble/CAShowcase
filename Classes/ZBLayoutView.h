#import <QuartzCore/QuartzCore.h>
#import "ZBLayoutLayer.h"

@interface ZBLayoutView : UIView 
{
	NSMutableArray *layers;
	UITouch *currentTouch;
	NSTimer *rotateTimer;
	NSUInteger rotateIndex;

	CGFloat radius;
	BOOL animationFlag;
}

@property (retain, nonatomic) UITouch *currentTouch;

@end
