#import "ZBAnimateTableViewController.h"

@implementation ZBAnimateTableViewController

- (void)removeOutletsAndControls_ZBAnimateTableViewController
{
	[transitionLayer release];
	transitionLayer = nil;
}

- (void)dealloc 
{
	[self removeOutletsAndControls_ZBAnimateTableViewController];
    [super dealloc];
}
- (void)viewDidUnload
{
	[super viewDidUnload];
	[self removeOutletsAndControls_ZBAnimateTableViewController];
}

- (id)init
{
	self = [super init];
	if (self != nil) {
		self.title = @"Tableview";
	}
	return self;
}


#pragma mark -
#pragma mark UIViewContoller Methods

- (void)viewDidLoad 
{
    [super viewDidLoad];
	if (!transitionLayer) {
		transitionLayer = [[CALayer alloc] init];
	}
	self.tableView.rowHeight = 100.0;
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Cell %d", indexPath.row];
	NSString *imageName = [NSString stringWithFormat:@"banana%d.tiff", (indexPath.row % 8 + 1)];
	cell.imageView.image = [UIImage imageNamed:imageName];
    return cell;
}
- (void)animationDidStop:(CAAnimation *)theAnimation finished:(BOOL)flag
{
	if ([theAnimation isEqual:[transitionLayer animationForKey:@"move"]]) {
		[transitionLayer removeFromSuperlayer];
		[transitionLayer removeAllAnimations];
	}
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	UITableViewCell *aCell = [tableView cellForRowAtIndexPath:indexPath];
	[CATransaction begin];
	[CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
	transitionLayer.opacity = 1.0;
	transitionLayer.contents = (id)aCell.imageView.image.CGImage;
	transitionLayer.frame = [[UIApplication sharedApplication].keyWindow convertRect:aCell.imageView.bounds fromView:aCell.imageView];
	[[UIApplication sharedApplication].keyWindow.layer addSublayer:transitionLayer];
	[CATransaction commit];
	
	CABasicAnimation *positionAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
	positionAnimation.fromValue = [NSValue valueWithCGPoint:transitionLayer.position];
	positionAnimation.toValue = [NSValue valueWithCGPoint:CGPointZero];

	CABasicAnimation *boundsAnimation = [CABasicAnimation animationWithKeyPath:@"bounds"];
	boundsAnimation.fromValue = [NSValue valueWithCGRect:transitionLayer.bounds];
	boundsAnimation.toValue = [NSValue valueWithCGRect:CGRectZero];

	CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
	opacityAnimation.fromValue = [NSNumber numberWithFloat:1.0];
	opacityAnimation.toValue = [NSNumber numberWithFloat:0.5];	
	
	CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
	rotateAnimation.fromValue = [NSNumber numberWithFloat:0 * M_PI];
	rotateAnimation.toValue = [NSNumber numberWithFloat:2 * M_PI];	
	
	
	CAAnimationGroup *group = [CAAnimationGroup animation];
	group.beginTime = CACurrentMediaTime() + 0.25;
	group.duration = 0.5;
	group.animations = [NSArray arrayWithObjects:positionAnimation, boundsAnimation, opacityAnimation, rotateAnimation, nil];
	group.delegate = self;
	group.fillMode = kCAFillModeForwards;
	group.removedOnCompletion = NO;
	
	[transitionLayer addAnimation:group forKey:@"move"];
	
	
    // Navigation logic may go here. Create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
	// [self.navigationController pushViewController:anotherViewController];
	// [anotherViewController release];
}


@end

