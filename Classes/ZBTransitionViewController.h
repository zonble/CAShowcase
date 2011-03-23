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

@property (retain, nonatomic) UIView *imageView;
@property (retain, nonatomic) UIButton *doAnimationButton;
@property (retain, nonatomic) UIButton *selectTypeButton;
@property (retain, nonatomic) UIButton *selectSubtypeButton;


@end
