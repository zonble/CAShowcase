#import "ZBPathViewController.h"

@implementation ZBPathViewController

- (instancetype)init
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
	self.view = pathView;
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	NSUInteger option = UIRectEdgeLeft | UIRectEdgeBottom | UIRectEdgeRight;
	[self setEdgesForExtendedLayout:option];
}

@end
