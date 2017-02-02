#import <QuartzCore/QuartzCore.h>

@class ZBGridControl;

@protocol ZBGridControlDelegate <NSObject>
@required
- (NSUInteger)numberOfItemsInGridControl:(ZBGridControl *)inControl;
- (UIImage *)imageForItemInGridControl:(ZBGridControl *)inControl atIndex:(NSUInteger)inIndex;
- (void)gridControl:(ZBGridControl *)inControl didSelectItemAtIndex:(NSUInteger)inIndex withLayer:(CALayer *)inLayer;
@end

@interface ZBGridControl : UIScrollView

- (void)reloadData;
- (void)resetSelection;

@property (weak, nonatomic) id <ZBGridControlDelegate> dataSource;
@property (readonly) NSUInteger selectedIndex;

@end
