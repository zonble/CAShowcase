#import "ZBBananaViewController.h"

@implementation ZBBananaViewController
{
	ZBBananaLayer *bananaLayer;
}

#pragma mark -
#pragma mark UIViewContoller Methods

- (void)loadView
{
	UIView *aView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
	aView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	aView.backgroundColor = [UIColor lightGrayColor];
	self.view = aView;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	self.title = @"Banana";

	if (!bananaLayer) {
		bananaLayer = [[ZBBananaLayer alloc] init];
		bananaLayer.frame = CGRectMake(10, 100, 120, 119);
		bananaLayer.contentsScale = [UIScreen mainScreen].scale;
		[self.view.layer addSublayer:bananaLayer];
	}
	[self move];
}

#pragma mark -
#pragma mark Instance methods

- (void)move
{
	CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
	animation.fromValue = [NSValue valueWithCGPoint:bananaLayer.position];
	CGPoint toPoint = bananaLayer.position;
	toPoint.x += 180;
	animation.toValue = [NSValue valueWithCGPoint:toPoint];

	CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
	rotateAnimation.fromValue = @0.0f;
	rotateAnimation.toValue = @(1.0 * M_PI);

	CABasicAnimation *scaoleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
	scaoleAnimation.duration = 0.5;
	scaoleAnimation.autoreverses = YES;
	scaoleAnimation.fromValue = @1.0;
	scaoleAnimation.toValue = @1.5;


	CAAnimationGroup *group = [CAAnimationGroup animation];
	group.autoreverses = YES;
	group.duration = 1.0;
	group.animations = @[animation, scaoleAnimation];
	group.repeatCount = NSNotFound;

	[bananaLayer addAnimation:group forKey:@"move"];
}

@end
