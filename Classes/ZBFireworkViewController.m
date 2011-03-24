#import "ZBFireworkViewController.h"
#import "ZBFireworkView.h"

@implementation ZBFireworkViewController

- (id)init 
{
    self = [super init];
    if (self) {
        self.title = @"Fireworks";
    }
    return self;
}

- (void)loadView 
{
	ZBFireworkView *aView = [[ZBFireworkView alloc] initWithFrame:[UIScreen mainScreen].bounds];
	aView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	self.view = [aView autorelease];
}

@end
