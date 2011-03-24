#import "ZBGridImageViewController.h"

@implementation ZBGridImageViewController

- (void)removeOutletsAndControls_ZBGridImageViewController
{
	imageView = nil;
}

- (void)dealloc 
{
	[self removeOutletsAndControls_ZBGridImageViewController];	
	[image release];
    [super dealloc];
}
- (void)viewDidUnload
{
	[super viewDidUnload];
	[self removeOutletsAndControls_ZBGridImageViewController];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (void)loadView 
{
	imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
	imageView.image = self.image;
	imageView.contentMode = UIViewContentModeScaleAspectFit;
	self.view = [imageView autorelease];
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStyleBordered target:self action:@selector(close:)];
	self.navigationItem.leftBarButtonItem = item;
	[item release];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackTranslucent animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
	[[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:animated];
}

- (IBAction)close:(id)sender
{
	[delegate imageViewControllerDidClose:self];
}

- (void)setImage:(UIImage *)inImage
{
	id tmp = image;
	image = [inImage retain];
	[tmp release];
	
	if (imageView) {
		imageView.image = image;
	}
}

- (UIImage *)image
{
	return image;
}

@synthesize delegate;

@end
