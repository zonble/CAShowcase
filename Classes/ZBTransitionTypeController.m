#import "ZBTransitionTypeController.h"

@implementation ZBTransitionTypeController

- (void)dealloc 
{
	[types release];
    [super dealloc];
}

- (id)init
{
	self = [super init];
	if (self != nil) {
		// http://iphonedevwiki.net/index.php/CATransition
		types = [[NSArray alloc] initWithObjects:kCATransitionFade,
				 kCATransitionMoveIn,
				 kCATransitionPush,
				 kCATransitionReveal,
				 @"cameraIris",
				 @"cameraIrisHollowOpen",
				 @"cameraIrisHollowClose",
				 @"cube",
				 @"alignedCube",
				 @"flip",
				 @"alignedFlip",
				 @"oglFlip",
				 @"rotate",
				 @"pageCurl",
				 @"pageUnCurl",
				 @"rippleEffect",
				 @"suckEffect",
//				 @"tubey",
//				 @"spewEffect",
//				 @"genieEffect",
//				 @"unGenieEffect",
//				 @"twist",
//				 @"swirl",
//				 @"charminUltra",
//				 @"reflection",
//				 @"zoomyIn",
//				 @"zoomyOut",
//				 @"mapCurl",
//				 @"mapUnCurl",
//				 @"oglApplicationSuspend",
				 nil];
		self.title = @"Types";
	}
	return self;
}


#pragma mark -
#pragma mark UIViewContoller Methods

/*
// Implement loadView to create a view hierarchy programmatically, without
// using a nib.
- (void)loadView 
{
}
*/
/*
- (void)viewDidLoad 
{
    [super viewDidLoad];
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
*/

- (void)didReceiveMemoryWarning
{
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [types count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
	NSString *string = [types objectAtIndex:indexPath.row];
	cell.textLabel.text = string;	
	if (indexPath.row == selectedIndex) {
		cell.accessoryType = UITableViewCellAccessoryCheckmark;
	}
	else {
		cell.accessoryType = UITableViewCellAccessoryNone;
	}
	
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	selectedIndex = indexPath.row;
	[delegate transitionTypeController:self didSelectType:self.selectedType];
	[tableView reloadData];
	[self.navigationController popViewControllerAnimated:YES];
}

- (NSString *)selectedType
{
	return [types objectAtIndex:selectedIndex];
}

@synthesize delegate;

@end

