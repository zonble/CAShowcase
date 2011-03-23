#import "ZBBananaViewController.h"

@implementation ZBBananaViewController

- (void)removeOutletsAndControls_BananaViewController
{
    // remove and clean outlets and controls here
	[bananaLayer release];
	bananaLayer = nil;
}

- (void)dealloc 
{
	[self removeOutletsAndControls_BananaViewController];
    [super dealloc];
}
- (void)viewDidUnload
{
	[super viewDidUnload];
	[self removeOutletsAndControls_BananaViewController];
}

#pragma mark -
#pragma mark UIViewContoller Methods

- (void)loadView 
{
	UIView *aView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
	aView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	aView.backgroundColor = [UIColor lightGrayColor];
	self.view = aView;
	[aView release];
}
- (void)viewDidLoad 
{
    [super viewDidLoad];
	self.title = @"Banana";
	
	if (!bananaLayer) {
		bananaLayer = [[ZBBananaLayer alloc] init];
		bananaLayer.frame = CGRectMake(10, 100, 120, 119);
		[self.view.layer addSublayer:bananaLayer];
	}
	[self move];
}
- (void)viewWillAppear:(BOOL)animated 
{
    [super viewWillAppear:animated];
}
- (void)viewDidAppear:(BOOL)animated 
{
    [super viewDidAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated 
{
	[super viewWillDisappear:animated];
}
- (void)viewDidDisappear:(BOOL)animated 
{
	[super viewDidDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark -
#pragma mark Instance methods

- (void)move
{
	CABasicAnimation *animation  = [CABasicAnimation animationWithKeyPath:@"position"];
	animation.fromValue = [NSValue valueWithCGPoint:bananaLayer.position];
	CGPoint toPoint = bananaLayer.position;
	toPoint.x += 180;
	animation.toValue = [NSValue valueWithCGPoint:toPoint];
	
	CABasicAnimation *rotateAnimation  = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
	rotateAnimation.fromValue = [NSNumber numberWithFloat:0.0];
	rotateAnimation.toValue = [NSNumber numberWithFloat:1.0 * M_PI];

	CABasicAnimation *scaoleAnimation  = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
	scaoleAnimation.duration = 0.5;
	scaoleAnimation.autoreverses = YES;
	scaoleAnimation.fromValue = [NSNumber numberWithFloat:1.0];
	scaoleAnimation.toValue = [NSNumber numberWithFloat:1.5];
	
	
	CAAnimationGroup *group = [CAAnimationGroup animation];
	group.autoreverses = YES;
	group.duration = 1.0;
	group.animations = [NSArray arrayWithObjects:animation, scaoleAnimation, nil];
	group.repeatCount = NSNotFound;
	
	[bananaLayer addAnimation:group forKey:@"move"];
}


#pragma mark -
#pragma mark Interface Builder actions

@end
