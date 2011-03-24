#import <QuartzCore/QuartzCore.h>

@class ZBGridControl;

@protocol ZBGridControlDelegate <NSObject>
@required
- (NSUInteger)numberOfItemsInGridControl:(ZBGridControl *)inControl;
- (UIImage *)imageForItemInGridControl:(ZBGridControl *)inControl atIndex:(NSUInteger)inIndex;
- (void)gridContol:(ZBGridControl *)inControl didSelectItemAtIndex:(NSUInteger)inIndex withLayer:(CALayer *)inLayer;
@end

@interface ZBGridControl : UIScrollView 
{
	id <ZBGridControlDelegate> dataSource;
    NSMutableArray *layers;
	NSUInteger selectedIndex;
}

- (void)reloadData;
- (void)resetSelection;

@property (assign, nonatomic) id <ZBGridControlDelegate> dataSource;
@property (readonly) NSUInteger selectedIndex;

@end
