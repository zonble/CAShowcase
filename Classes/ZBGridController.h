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

@property (retain, nonatomic) ZBGridControl *control;
@property (retain, nonatomic) ZBGridLayer *transitionLayer;

@end
