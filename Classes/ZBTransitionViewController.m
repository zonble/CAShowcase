#import "ZBTransitionViewController.h"

@interface CAFilter : NSObject 

@end

@implementation ZBTransitionViewController

- (void)removeOutletsAndControls_ZBTransitionViewController
{
	self.imageView = nil;
	self.doAnimationButton = nil;
	self.selectTypeButton = nil;
	self.selectSubtypeButton = nil;
}

- (void)viewDidUnload
{
	[super viewDidUnload];
	[self removeOutletsAndControls_ZBTransitionViewController];
}

- (void)dealloc 
{
	[self removeOutletsAndControls_ZBTransitionViewController];
	[images release];
	[typeController release];
	[subtypeController release];
	[settingController release];
	[settingNavController release];
	[super dealloc];
}

- (void)didReceiveMemoryWarning
{
	// Releases the view if it doesn't have a superview.
	[super didReceiveMemoryWarning];
	// Release any cached data, images, etc that aren't in use.
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (id) init
{
	self = [super init];
	if (self != nil) {
		images = [[NSArray alloc] initWithObjects:@"bike1.jpg", @"bike2.jpg", @"bike3.jpg", @"bike4.jpg", @"bike5.jpg", nil];
	}
	return self;
}


#pragma mark -
#pragma mark UIViewContoller Methods

- (void)loadView 
{
	self.view = [[[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds] autorelease];
	self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	self.view.backgroundColor = [UIColor blackColor];
	
	self.imageView = [[[UIView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.bounds.size.width, self.view.bounds.size.height - 160.0)] autorelease];
	self.imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	[self.view addSubview:self.imageView];
	[self.imageView setIsAccessibilityElement:YES];
	[self.imageView setAccessibilityLabel:@"Image"];
	[self.imageView setAccessibilityTraits:UIAccessibilityTraitImage];
	
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
	[self.selectTypeButton setAccessibilityHint:@"Double-tap to change type."];

	self.selectSubtypeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	self.selectSubtypeButton.frame = CGRectMake(10.0, self.view.bounds.size.height - 55.0, self.view.bounds.size.width - 20.0, 40.0);
	self.selectSubtypeButton.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
	[self.selectSubtypeButton addTarget:self action:@selector(selectSubtype:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:self.selectSubtypeButton];
	[self.selectSubtypeButton setAccessibilityHint:@"Double-tap to change subtype."];
}
- (void)viewDidLoad 
{
	[super viewDidLoad];
	self.title = @"Transitions";
	
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
	UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStyleBordered target:self action:@selector(showSettings:)];
	self.navigationItem.rightBarButtonItem = item;
	[item release];
	
	self.imageView.layer.contents = (id)[UIImage imageNamed:[images objectAtIndex:imageIndex]].CGImage;
	
}
- (void)viewWillAppear:(BOOL)animated 
{
	[super viewWillAppear:animated];
}
- (void)viewDidAppear:(BOOL)animated 
{
	[super viewDidAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated 
{
	[super viewWillDisappear:animated];
}
- (void)viewDidDisappear:(BOOL)animated 
{
	[super viewDidDisappear:animated];
}


#pragma mark -
#pragma mark Instance methods


#pragma mark -
#pragma mark Interface Builder actions

- (IBAction)doAnimation:(id)sender
{
	if (++imageIndex >= [images count]) {
		imageIndex = 0;
	}
	CATransition *t = [CATransition animation];
	t.type = typeController.selectedType;
	t.subtype = subtypeController.selectedSubtype;
	
	if (settingController.useLongerAnimationDuration) {
		t.duration = 1.5;
		t.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
	}

	self.imageView.layer.contents = (id)[UIImage imageNamed:[images objectAtIndex:imageIndex]].CGImage;
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
	[self.navigationController presentModalViewController:settingNavController animated:YES];
}

#pragma mark -

- (void)transitionTypeController:(ZBTransitionTypeController*)inController didSelectType:(NSString *)type
{
	NSString *typeTitle = [NSString stringWithFormat:@"Type: %@", type];
	[self.selectTypeButton setTitle:typeTitle forState:UIControlStateNormal];
}
- (void)transitionSubtypeController:(ZBTransitionSubtypeController*)inController didSelectSubtype:(NSString *)subtype
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
