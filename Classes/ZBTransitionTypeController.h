#import <QuartzCore/QuartzCore.h>

@class ZBTransitionTypeController;

@protocol ZBTransitionTypeControllerDelegate
- (void)transitionTypeController:(ZBTransitionTypeController*)inController didSelectType:(NSString *)type;
@end

@interface ZBTransitionTypeController : UITableViewController 
{
	id <ZBTransitionTypeControllerDelegate> delegate;
	NSArray *types;
	NSUInteger selectedIndex;
}

@property (assign) id <ZBTransitionTypeControllerDelegate> delegate;
@property (readonly) NSString *selectedType;

@end
