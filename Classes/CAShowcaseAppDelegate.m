#import "CAShowcaseAppDelegate.h"
#import "RootViewController.h"

@implementation CAShowcaseAppDelegate

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 
{
	self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
	RootViewController *controller = [[RootViewController alloc] initWithStyle:UITableViewStylePlain];
	self.navigationController = [[UINavigationController alloc] initWithRootViewController:controller];
	self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

@end

