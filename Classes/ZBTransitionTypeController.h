#import <QuartzCore/QuartzCore.h>

@class ZBTransitionTypeController;

@protocol ZBTransitionTypeControllerDelegate
- (void)transitionTypeController:(ZBTransitionTypeController*)inController didSelectType:(NSString *)type;
@end

@interface ZBTransitionTypeController : UITableViewController 
{
	id <ZBTransitionTypeControllerDelegate> __weak delegate;
	NSArray *types;
	NSUInteger selectedIndex;
}

@property (weak) id <ZBTransitionTypeControllerDelegate> delegate;
@property (weak, readonly) NSString *selectedType;

@end
