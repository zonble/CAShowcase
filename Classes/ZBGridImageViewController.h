#import <UIKit/UIKit.h>

@class ZBGridImageViewController;

@protocol ZBGridImageViewControllerDelegate <NSObject>
- (void)imageViewControllerDidClose:(ZBGridImageViewController *)inController;
@end

@interface ZBGridImageViewController : UIViewController

- (IBAction)close:(id)sender;

@property (weak, nonatomic) id <ZBGridImageViewControllerDelegate> delegate;
@property (strong, nonatomic) UIImage *image;
@property (strong, nonatomic) UILabel *label;

@end
