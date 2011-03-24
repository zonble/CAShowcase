#import <QuartzCore/QuartzCore.h>
#import "ZBLayoutLayer.h"

@interface ZBFireworkLayer : CALayer 
{

}

- (id)initWithHue:(CGFloat)inHue;
- (void)animateInLayer:(CALayer *)inSuperlayer from:(CGPoint)inFrom to:(CGPoint)inTo;

@end
