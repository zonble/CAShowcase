#import <QuartzCore/QuartzCore.h>

@class ZBTransitionSubtypeController;

@protocol ZBTransitionSubtypeControllerDelegate
- (void)transitionSubtypeController:(ZBTransitionSubtypeController*)inController didSelectSubtype:(NSString *)subtype;
@end

@interface ZBTransitionSubtypeController : UITableViewController 
{
	id <ZBTransitionSubtypeControllerDelegate> delegate;
	NSArray *subtypes;
	NSUInteger selectedIndex;	
}

@property (assign) id <ZBTransitionSubtypeControllerDelegate> delegate;
@property (readonly) NSString *selectedSubtype;


@end
