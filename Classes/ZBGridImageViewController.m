#import "ZBGridImageViewController.h"

@implementation ZBGridImageViewController

- (void)removeOutletsAndControls_ZBGridImageViewController
{
	imageView = nil;
	self.label = nil;
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
	imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
	imageView.image = self.image;
	imageView.contentMode = UIViewContentModeScaleAspectFit;
	imageView.backgroundColor = [UIColor darkGrayColor];
	self.view = [imageView autorelease];
	
	label = [[UILabel alloc] initWithFrame:CGRectMake(10.0, self.view.bounds.size.height - 80.0, self.view.bounds.size.width - 20.0, 60.0)];
	label.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
	label.numberOfLines = 3;
	label.textColor = [UIColor whiteColor];
	label.backgroundColor = [UIColor clearColor];
	label.text = @"Lorem ipsum dolor sit amet, odio quis adipiscing ligula. Augue tellus amet diam justo et nulla";
	label.font = [UIFont boldSystemFontOfSize:13.0];
	[self.view addSubview:label];
	
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
@synthesize label;

@end
