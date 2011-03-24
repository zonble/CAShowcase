#import "ZBGridController.h"
#import "UIView+Screenshot.h"

@implementation ZBGridController

- (void)removeOutletsAndControls_ZBGridController
{
    // remove and clean outlets and controls here
	self.control = nil;
}

- (void)dealloc 
{
	[self removeOutletsAndControls_ZBGridController];
	[transitionLayer release];
	[images release];
    [super dealloc];
}
- (void)viewDidUnload
{
	[super viewDidUnload];
	[self removeOutletsAndControls_ZBGridController];
}
- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (id)init 
{
    self = [super init];
    if (self) {
		self.title = @"Grid Control";
		images = [[NSArray alloc] initWithObjects:@"bike1.jpg", @"bike2.jpg", @"bike3.jpg", @"bike4.jpg", @"bike5.jpg",
				  @"bike1.jpg", @"bike2.jpg", @"bike3.jpg", @"bike4.jpg", @"bike5.jpg",
				  @"bike1.jpg", @"bike2.jpg", @"bike3.jpg", @"bike4.jpg", @"bike5.jpg", nil];
		imageViewController = [[ZBGridImageViewController alloc] init];
		imageViewController.delegate = self;
		imageNavController = [[UINavigationController alloc] initWithRootViewController:imageViewController];
		imageNavController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    }
    return self;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (void)loadView 
{
	UIView *aView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
	aView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	self.view = [aView autorelease];
	
	ZBGridControl *aControl = [[ZBGridControl alloc] initWithFrame:aView.bounds];
	aControl.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	aControl.dataSource = self;
	self.control = [aControl autorelease];
	[self.view addSubview:self.control];
}
/*
- (void)viewDidLoad 
{
    [super viewDidLoad];
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
*/

#pragma -

- (void)imageViewControllerDidClose:(ZBGridImageViewController *)inController
{
	[self dismissModalViewControllerAnimated:NO];
	[CATransaction begin];
	[CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
	self.transitionLayer.frame = self.navigationController.view.bounds;
	[self.transitionLayer removeAllAnimations];
	[CATransaction commit];
	[control resetSelection];
	self.transitionLayer = nil;
}

#pragma -

- (NSUInteger)numberOfItemsInGridControl:(ZBGridControl *)inControl
{
	return [images count];
}
- (UIImage *)imageForItemInGridControl:(ZBGridControl *)inControl atIndex:(NSUInteger)inIndex
{
	UIImage *image = [UIImage imageNamed:[images objectAtIndex:inIndex]];
	return image;
}

- (void)gridContol:(ZBGridControl *)inControl didSelectItemAtIndex:(NSUInteger)inIndex withLayer:(CALayer *)inLayer;
{
	UIImage *image = [UIImage imageNamed:[images objectAtIndex:inIndex]];
	imageViewController.image = image;
	imageNavController.view.frame = self.navigationController.view.frame;
	UIImage *screenshot = [imageViewController.view screenshot];
	
	self.transitionLayer = (ZBGridLayer *)inLayer;
	
	CGRect fromRect = [self.navigationController.view.layer convertRect:inLayer.frame fromLayer:inLayer.superlayer];
	[CATransaction begin];
	[CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
	[self.navigationController.view.layer addSublayer:self.transitionLayer];
	self.transitionLayer.frame = fromRect;
	[CATransaction commit];

	CABasicAnimation *contentsAnimation = [CABasicAnimation animationWithKeyPath:@"contents"];
	contentsAnimation.fromValue = self.transitionLayer.contents;
	contentsAnimation.toValue = (id)screenshot.CGImage;
	
	CABasicAnimation *boundsAnimation = [CABasicAnimation animationWithKeyPath:@"bounds"];
	boundsAnimation.fromValue = [NSValue valueWithCGRect:self.transitionLayer.frame];
	boundsAnimation.toValue = [NSValue valueWithCGRect:self.navigationController.view.bounds];

	CABasicAnimation *positionAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
	positionAnimation.fromValue = [NSValue valueWithCGPoint:self.transitionLayer.position];
	positionAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(CGRectGetMidX(self.navigationController.view.bounds), CGRectGetMidY(self.navigationController.view.bounds))];
	
	CAAnimationGroup *group = [CAAnimationGroup animation];
	group.duration = 0.25;
	group.animations = [NSArray arrayWithObjects:contentsAnimation, boundsAnimation, positionAnimation, nil];
	group.fillMode = kCAFillModeForwards;
	group.removedOnCompletion = NO;
	group.delegate = self;
	[self.transitionLayer addAnimation:group forKey:@"zoomIn"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
	if (anim == [self.transitionLayer animationForKey:@"zoomIn"]) {
		self.transitionLayer.hidden = YES;
		[self.navigationController presentModalViewController:imageNavController animated:NO];
	}
}

@synthesize control;
@synthesize transitionLayer;

@end

