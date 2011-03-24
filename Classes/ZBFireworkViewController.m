#import "ZBFireworkViewController.h"
#import "ZBFireworkView.h"

@implementation ZBFireworkViewController

- (void)loadView 
{
	ZBFireworkView *aView = [[ZBFireworkView alloc] initWithFrame:[UIScreen mainScreen].bounds];
	aView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	self.view = [aView autorelease];
}

@end
