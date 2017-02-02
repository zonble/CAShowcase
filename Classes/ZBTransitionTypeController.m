#import "ZBTransitionTypeController.h"

@implementation ZBTransitionTypeController

- (instancetype)init
{
	self = [super init];
	if (self != nil) {
		// http://iphonedevwiki.net/index.php/CATransition
		types = @[kCATransitionFade,
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
				 @"suckEffect"];
		self.title = @"Types";
	}
	return self;
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return types.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
	NSString *string = types[indexPath.row];
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
	return types[selectedIndex];
}

@synthesize delegate;

@end

