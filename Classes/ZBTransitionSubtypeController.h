#import <QuartzCore/QuartzCore.h>

@class ZBTransitionSubtypeController;

@protocol ZBTransitionSubtypeControllerDelegate
- (void)transitionSubtypeController:(ZBTransitionSubtypeController*)inController didSelectSubtype:(NSString *)subtype;
@end

@interface ZBTransitionSubtypeController : UITableViewController 
{
	id <ZBTransitionSubtypeControllerDelegate> __weak delegate;
	NSArray *subtypes;
	NSUInteger selectedIndex;	
}

@property (weak) id <ZBTransitionSubtypeControllerDelegate> delegate;
@property (weak, readonly) NSString *selectedSubtype;


@end
