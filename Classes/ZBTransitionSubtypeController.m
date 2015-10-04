#import "ZBTransitionSubtypeController.h"

@implementation ZBTransitionSubtypeController


- (instancetype) init
{
	self = [super init];
	if (self != nil) {
		subtypes = @[kCATransitionFromRight,
					kCATransitionFromLeft,
					kCATransitionFromTop,
					kCATransitionFromBottom];
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
	return subtypes.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    NSString *subtype = subtypes[indexPath.row];
	cell.textLabel.text = subtype;
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
	[tableView reloadData];
	[delegate transitionSubtypeController:self didSelectSubtype:self.selectedSubtype];
	[self.navigationController popViewControllerAnimated:YES];
}

- (NSString *)selectedSubtype
{
	return subtypes[selectedIndex];
}

@synthesize delegate;


@end

