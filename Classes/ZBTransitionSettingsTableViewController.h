#import <UIKit/UIKit.h>

@interface ZBTransitionSettingsTableViewController : UITableViewController 
{
	UISwitch *useFullViewSwitch;
	UISwitch *useLongerAnimationDurationSwitch;
	BOOL useFullView;
	BOOL useLongerAnimationDuration;
}

- (IBAction)updateSetting:(id)sender;
- (IBAction)close:(id)sender;

@property (assign, nonatomic) BOOL useFullView;
@property (assign, nonatomic) BOOL useLongerAnimationDuration;


@end
