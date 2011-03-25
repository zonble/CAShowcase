#import "ZBPathViewController.h"

@implementation ZBPathViewController

- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"CAKeyframeAnimation";
    }
    return self;
}
- (void)loadView 
{
	ZBPathView *pathView = [[ZBPathView alloc] initWithFrame:[UIScreen mainScreen].bounds];
	pathView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	self.view = [pathView autorelease];
}

@end
