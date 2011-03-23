//
//  ZBBananaLayer.h
//  Banana
//

#import <QuartzCore/QuartzCore.h>

@interface ZBBananaLayer : CALayer
{
	NSUInteger imageIndex;
	NSTimer *animationTimer;
	NSArray *images;
}

@end
