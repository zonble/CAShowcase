#import <QuartzCore/QuartzCore.h>
#import "ZBTransitionTypeController.h"
#import "ZBTransitionSubtypeController.h"
#import "ZBTransitionSettingsTableViewController.h"

@interface ZBTransitionViewController : UIViewController 
	<ZBTransitionTypeControllerDelegate,
	 ZBTransitionSubtypeControllerDelegate>
{
	UIView *imageView;
	UIButton *doAnimationButton;
	UIButton *selectTypeButton;
	UIButton *selectSubtypeButton;
	
	NSUInteger imageIndex;
	NSArray *images;
	ZBTransitionTypeController *typeController;
	ZBTransitionSubtypeController *subtypeController;
	ZBTransitionSettingsTableViewController *settingController;
	UINavigationController *settingNavController;
}

- (IBAction)doAnimation:(id)sender;
- (IBAction)selectType:(id)sender;
- (IBAction)selectSubtype:(id)sender;
- (IBAction)showSettings:(id)sender;

@property (strong, nonatomic) UIView *imageView;
@property (strong, nonatomic) UIButton *doAnimationButton;
@property (strong, nonatomic) UIButton *selectTypeButton;
@property (strong, nonatomic) UIButton *selectSubtypeButton;


@end
