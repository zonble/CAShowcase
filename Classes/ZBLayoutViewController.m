#import "ZBLayoutViewController.h"

@implementation ZBLayoutViewController

- (id)init
{
	self = [super init];
	if (self != nil) {
		self.title = @"Auto-layout";
	}
	return self;
}

- (void)loadView 
{
	ZBLayoutView *aView = [[ZBLayoutView alloc] initWithFrame:[UIScreen mainScreen].bounds];
	aView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
	self.view = [aView autorelease];
}

 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

@end
