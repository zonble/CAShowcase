#import "ZBTransitionSettingsTableViewController.h"

@implementation ZBTransitionSettingsTableViewController

- (void)removeOutletsAndControls_ZBTransitionSettingsTableViewController
{
	[useFullViewSwitch release];
	useFullViewSwitch = nil;
	[useLongerAnimationDurationSwitch release];
	useLongerAnimationDurationSwitch = nil;
}

- (void)dealloc 
{
	[self removeOutletsAndControls_ZBTransitionSettingsTableViewController];
    [super dealloc];
}
- (void)viewDidUnload
{
	[super viewDidUnload];
	[self removeOutletsAndControls_ZBTransitionSettingsTableViewController];
}

#pragma mark -
#pragma mark UIViewContoller Methods

- (void)viewDidLoad 
{
    [super viewDidLoad];
	if (!useFullViewSwitch) {
		useFullViewSwitch = [[UISwitch alloc] init];
		[useFullViewSwitch addTarget:self action:@selector(updateSetting:) forControlEvents:UIControlEventValueChanged];
	}
	if (!useLongerAnimationDurationSwitch) {
		useLongerAnimationDurationSwitch = [[UISwitch alloc] init];
		[useLongerAnimationDurationSwitch addTarget:self action:@selector(updateSetting:) forControlEvents:UIControlEventValueChanged];
	}
	UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(close:)];
	self.navigationItem.leftBarButtonItem = item;
	[item release];
}
- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	useFullViewSwitch.on = useFullView;
	useLongerAnimationDurationSwitch.on = useLongerAnimationDuration;
}

- (IBAction)updateSetting:(id)sender
{
	self.useFullView = useFullViewSwitch.on;
	self.useLongerAnimationDuration = useLongerAnimationDurationSwitch.on;
}
- (IBAction)close:(id)sender
{
	[self.navigationController.parentViewController dismissModalViewControllerAnimated:YES];
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
	cell.selectionStyle = UITableViewCellSelectionStyleNone;
	switch (indexPath.row) {
		case 0:
			cell.textLabel.text = @"Animate full view";
			cell.accessoryView = useFullViewSwitch;
			break;
		case 1:
			cell.textLabel.text = @"Slower";
			cell.accessoryView = useLongerAnimationDurationSwitch;
			break;			
		default:
			break;
	}	
    return cell;
}

@synthesize useFullView;
@synthesize useLongerAnimationDuration;

@end

