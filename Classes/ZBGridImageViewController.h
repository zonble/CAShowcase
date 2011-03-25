#import <UIKit/UIKit.h>

@class ZBGridImageViewController;

@protocol ZBGridImageViewControllerDelegate <NSObject>

- (void)imageViewControllerDidClose:(ZBGridImageViewController *)inController;

@end

@interface ZBGridImageViewController : UIViewController 
{
	id <ZBGridImageViewControllerDelegate> delegate;
	UIImageView *imageView;
	UIImage *image;
	UILabel *label;
}

- (IBAction)close:(id)sender;

@property (assign, nonatomic) id <ZBGridImageViewControllerDelegate> delegate;
@property (retain, nonatomic) UIImage *image;
@property (retain, nonatomic) UILabel *label;

@end
