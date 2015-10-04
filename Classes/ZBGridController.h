#import <QuartzCore/QuartzCore.h>
#import "ZBGridImageViewController.h"
#import "ZBGridControl.h"
#import "ZBGridLayer.h"

@interface ZBGridController : UIViewController
	<ZBGridControlDelegate, ZBGridImageViewControllerDelegate>
{
	ZBGridControl *control;
	ZBGridImageViewController *imageViewController;
	UINavigationController *imageNavController;
    NSArray *images;

	ZBGridLayer *transitionLayer;
}

@property (strong, nonatomic) ZBGridControl *control;
@property (strong, nonatomic) ZBGridLayer *transitionLayer;

@end
