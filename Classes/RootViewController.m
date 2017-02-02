#import "RootViewController.h"
#import "ZBBananaViewController.h"
#import "ZBPathViewController.h"
#import "ZBTransitionViewController.h"
#import "ZBLayoutViewController.h"
#import "ZBAnimateTableViewController.h"
#import "ZBFireworkViewController.h"
#import "ZBGridController.h"
#import "ZBTransformViewController.h"
#import "ZBInvertedViewController.h"

@implementation RootViewController

#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning 
{
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad
{
	[super viewDidLoad];
	self.title = @"Showcases";
}

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView 
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section 
{
    return 9;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
	cell.textLabel.text = @[@"1. Basic Animation",
						   @"2. CAKeyframeAnimation",
						   @"3. Transitions",
						   @"4. Auto-layout",
						   @"5. Tableview",
						   @"6. Fireworks",
						   @"7. Grid Control",
						   @"8. Transform", 
						   @"9. Inverted Effect"][indexPath.row];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath 
{
	NSArray *classes = @[@"ZBBananaViewController",
						@"ZBPathViewController",
						@"ZBTransitionViewController",
						@"ZBLayoutViewController",
						@"ZBAnimateTableViewController",
						@"ZBFireworkViewController",
						@"ZBGridController",
						@"ZBTransformViewController",
						@"ZBInvertedViewController"];
	UIViewController *controller = [[NSClassFromString(classes[indexPath.row]) alloc] init];
	[self.navigationController pushViewController:controller animated:YES];
}

@end



