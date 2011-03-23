#import <UIKit/UIKit.h>

@class CAShowcaseAppDelegate;

int main(int argc, char *argv[]) {
    
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, NSStringFromClass([CAShowcaseAppDelegate class]));
    [pool release];
    return retVal;
}
