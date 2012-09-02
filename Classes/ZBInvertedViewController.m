#import "ZBInvertedViewController.h"
#import "UIView+Screenshot.h"

@implementation ZBInvertedViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (id)init
{
    self = [super initWithNibName:NSStringFromClass([ZBInvertedViewController class]) bundle:[NSBundle mainBundle]];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"Inverted Effect";
	
	scrollView.backgroundColor = [UIColor whiteColor];
	[scrollView addSubview:contentView];
	scrollView.contentSize = contentView.bounds.size;
	scrollView.delegate = self;
	scrollView.showsVerticalScrollIndicator = NO;
	scrollView.showsHorizontalScrollIndicator = NO;
	
	if (!invertedImageLayer) {
		invertedImageLayer = [[CALayer alloc] init];
		invertedImageLayer.frame = contentView.frame;
	}
	
	if (!clipLayer) {
		clipLayer = [[CALayer alloc] init];
		[self.view.layer addSublayer:clipLayer];
	}
	clipLayer.frame = CGRectMake(0.0, 100.0, 320.0, 80.0);
	clipLayer.masksToBounds = YES;
	[clipLayer addSublayer:invertedImageLayer];
	
	CGRect aFrame = invertedImageLayer.frame;
	aFrame.origin.y = 0 - clipLayer.frame.origin.y;
	invertedImageLayer.frame = aFrame;
	
	UIImage *screenshot = [contentView invertedScreenshot];
	invertedImageLayer.contents = (id)screenshot.CGImage;
//	clipLayer.borderWidth = 2.0;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
	self.scrollView = nil;
	self.contentView = nil;
}
- (void)scrollViewDidScroll:(UIScrollView *)inScrollView
{
	CGRect aFrame = invertedImageLayer.frame;
	aFrame.origin.y = 0 - inScrollView.contentOffset.y - clipLayer.frame.origin.y;	
	[CATransaction begin];
	[CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions]; 
	invertedImageLayer.frame = aFrame;
	[CATransaction commit];	
}

@synthesize scrollView;
@synthesize contentView;

@end
