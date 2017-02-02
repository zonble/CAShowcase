#import "ZBTransitionViewController.h"

@interface CAFilter : NSObject

@end

@implementation ZBTransitionViewController
{
	UIView *imageView;
	UIButton *doAnimationButton;
	UIButton *selectTypeButton;
	UIButton *selectSubtypeButton;

	NSUInteger imageIndex;
	NSArray *images;
	ZBTransitionTypeController *typeController;
	ZBTransitionSubtypeController *subtypeController;
	ZBTransitionSettingsTableViewController *settingController;
	UINavigationController *settingNavController;
}

- (void)removeOutletsAndControls_ZBTransitionViewController
{
	self.imageView = nil;
	self.doAnimationButton = nil;
	self.selectTypeButton = nil;
	self.selectSubtypeButton = nil;
}

- (void)dealloc
{
	[self removeOutletsAndControls_ZBTransitionViewController];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (instancetype)init
{
	self = [super init];
	if (self != nil) {
		images = @[@"bike1.jpg", @"bike2.jpg", @"bike3.jpg", @"bike4.jpg", @"bike5.jpg"];
	}
	return self;
}


#pragma mark -
#pragma mark UIViewContoller Methods

- (void)loadView
{
	self.view = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
	self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	self.view.backgroundColor = [UIColor blackColor];

	self.imageView = [[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.bounds.size.width, self.view.bounds.size.height - 160.0)];
	self.imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	[self.view addSubview:self.imageView];
	[self.imageView setIsAccessibilityElement:YES];
	(self.imageView).accessibilityLabel = @"Image";
	(self.imageView).accessibilityTraits = UIAccessibilityTraitImage;

	self.doAnimationButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	self.doAnimationButton.frame = CGRectMake(10.0, self.view.bounds.size.height - 145.0, self.view.bounds.size.width - 20.0, 40.0);
	self.doAnimationButton.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
	[self.doAnimationButton addTarget:self action:@selector(doAnimation:) forControlEvents:UIControlEventTouchUpInside];
	[self.doAnimationButton setTitle:@"Do Animation!" forState:UIControlStateNormal];
	[self.view addSubview:self.doAnimationButton];

	self.selectTypeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	self.selectTypeButton.frame = CGRectMake(10.0, self.view.bounds.size.height - 100.0, self.view.bounds.size.width - 20.0, 40.0);
	self.selectTypeButton.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
	[self.selectTypeButton addTarget:self action:@selector(selectType:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:self.selectTypeButton];
	(self.selectTypeButton).accessibilityHint = @"Double-tap to change type.";

	self.selectSubtypeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	self.selectSubtypeButton.frame = CGRectMake(10.0, self.view.bounds.size.height - 55.0, self.view.bounds.size.width - 20.0, 40.0);
	self.selectSubtypeButton.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
	[self.selectSubtypeButton addTarget:self action:@selector(selectSubtype:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:self.selectSubtypeButton];
	(self.selectSubtypeButton).accessibilityHint = @"Double-tap to change subtype.";
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	self.title = @"Transitions";
	NSUInteger option = UIRectEdgeLeft | UIRectEdgeBottom | UIRectEdgeRight;
	[self setEdgesForExtendedLayout:option];

	if (!typeController) {
		typeController = [[ZBTransitionTypeController alloc] init];
		typeController.delegate = self;
	}
	NSString *typeTitle = [NSString stringWithFormat:@"Type: %@", typeController.selectedType];
	[self.selectTypeButton setTitle:typeTitle forState:UIControlStateNormal];
	if (!subtypeController) {
		subtypeController = [[ZBTransitionSubtypeController alloc] init];
		subtypeController.delegate = self;
	}
	NSString *subtypeTitle = [NSString stringWithFormat:@"Subtype: %@", subtypeController.selectedSubtype];
	[self.selectSubtypeButton setTitle:subtypeTitle forState:UIControlStateNormal];

	if (!settingController) {
		settingController = [[ZBTransitionSettingsTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
	}
	if (!settingNavController) {
		settingNavController = [[UINavigationController alloc] initWithRootViewController:settingController];
	}
	UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(showSettings:)];
	self.navigationItem.rightBarButtonItem = item;
	self.imageView.layer.contents = (id)[UIImage imageNamed:images[imageIndex]].CGImage;
}


#pragma mark -
#pragma mark Instance methods


#pragma mark -
#pragma mark Interface Builder actions

- (IBAction)doAnimation:(id)sender
{
	if (++imageIndex >= images.count) {
		imageIndex = 0;
	}
	CATransition *t = [CATransition animation];
	t.type = typeController.selectedType;
	t.subtype = subtypeController.selectedSubtype;

	if (settingController.useLongerAnimationDuration) {
		t.duration = 1.5;
		t.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
	}

	self.imageView.layer.contents = (id)[UIImage imageNamed:images[imageIndex]].CGImage;
	if (settingController.useFullView) {
		[self.navigationController.view.layer addAnimation:t forKey:@"Transition"];
	}
	else {
		[self.imageView.layer addAnimation:t forKey:@"Transition"];
	}
}

- (IBAction)selectType:(id)sender
{
	[self.navigationController pushViewController:typeController animated:YES];
}

- (IBAction)selectSubtype:(id)sender
{
	[self.navigationController pushViewController:subtypeController animated:YES];
}

- (IBAction)showSettings:(id)sender
{
	[self.navigationController presentViewController:settingNavController animated:YES completion:nil];
}

#pragma mark -

- (void)transitionTypeController:(ZBTransitionTypeController *)inController didSelectType:(NSString *)type
{
	NSString *typeTitle = [NSString stringWithFormat:@"Type: %@", type];
	[self.selectTypeButton setTitle:typeTitle forState:UIControlStateNormal];
}

- (void)transitionSubtypeController:(ZBTransitionSubtypeController *)inController didSelectSubtype:(NSString *)subtype
{
	NSString *subtypeTitle = [NSString stringWithFormat:@"Subtype: %@", subtypeController.selectedSubtype];
	[self.selectSubtypeButton setTitle:subtypeTitle forState:UIControlStateNormal];
}

#pragma mark -
#pragma mark Properties

@synthesize imageView;
@synthesize doAnimationButton;
@synthesize selectTypeButton;
@synthesize selectSubtypeButton;

@end
