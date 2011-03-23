#import <UIKit/UIKit.h>
#import "CAShowcaseAppDelegate.h"

int main(int argc, char *argv[]) {
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, NSStringFromClass([CAShowcaseAppDelegate class]));
    [pool release];
    return retVal;
}
