#import "ZBTransformViewController.h"
#import "ZBGridLayer.h"

@implementation ZBTransformViewController

- (void)removeOutletsAndControls_ZBTransformViewController
{
    // remove and clean outlets and controls here
}

- (void)dealloc 
{
	[self removeOutletsAndControls_ZBTransformViewController];
    [super dealloc];
}
- (void)viewDidUnload
{
	[super viewDidUnload];
	[self removeOutletsAndControls_ZBTransformViewController];
}
- (void)didReceiveMemoryWarning
{
	[super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (id)init
{
    self = [super init];
    if (self) {
        self.title = @"Transform";
    }
    return self;
}

- (void)loadView 
{
	UIView *aView = [[UIView alloc] initWithFrame:[UIScreen mainScreen].bounds];
	aView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
	aView.backgroundColor = [UIColor grayColor];
	self.view = [aView autorelease];
	
	ZBGridLayer *layer1 = [[[ZBGridLayer alloc] init] autorelease];
	layer1.frame = CGRectMake(20.0, 20.0, 100.0, 100.0);
	layer1.image = [UIImage imageNamed:@"bike1.jpg"];
	[self.view.layer addSublayer:layer1];
	
	CABasicAnimation *a1 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
	a1.fromValue = [NSNumber numberWithFloat:0.0];
	a1.toValue = [NSNumber numberWithFloat:M_PI * 2];
	a1.autoreverses = YES;
	a1.repeatCount = NSUIntegerMax;
	a1.duration = 2.0;
	[layer1 addAnimation:a1 forKey:@"x"];

	ZBGridLayer *layer2 = [[[ZBGridLayer alloc] init] autorelease];
	layer2.frame = CGRectMake(20.0, 140.0, 100.0, 100.0);
	layer2.image = [UIImage imageNamed:@"bike2.jpg"];
	[self.view.layer addSublayer:layer2];

	CABasicAnimation *a2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
	a2.fromValue = [NSNumber numberWithFloat:0.0];
	a2.toValue = [NSNumber numberWithFloat:M_PI * 2];
	a2.autoreverses = YES;
	a2.repeatCount = NSUIntegerMax;
	a2.duration = 2.0;
	[layer2 addAnimation:a2 forKey:@"y"];

	ZBGridLayer *layer3 = [[[ZBGridLayer alloc] init] autorelease];
	layer3.frame = CGRectMake(20.0, 260.0, 100.0, 100.0);
	layer3.image = [UIImage imageNamed:@"bike3.jpg"];
	[self.view.layer addSublayer:layer3];

	CABasicAnimation *a3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
	a3.fromValue = [NSNumber numberWithFloat:0.0];
	a3.toValue = [NSNumber numberWithFloat:M_PI * 2];
	a3.autoreverses = YES;
	a3.repeatCount = NSUIntegerMax;
	a3.duration = 2.0;
	[layer3 addAnimation:a3 forKey:@"z"];
	
	ZBGridLayer *layer4 = [[[ZBGridLayer alloc] init] autorelease];
	layer4.frame = CGRectMake(140.0, 20.0, 100.0, 100.0);
	layer4.image = [UIImage imageNamed:@"bike1.jpg"];
	[self.view.layer addSublayer:layer4];

	[layer4 addAnimation:a1 forKey:@"x"];
	[layer4 addAnimation:a2 forKey:@"y"];

	ZBGridLayer *layer5 = [[[ZBGridLayer alloc] init] autorelease];
	layer5.frame = CGRectMake(140.0, 140.0, 100.0, 100.0);
	layer5.image = [UIImage imageNamed:@"bike2.jpg"];
	[self.view.layer addSublayer:layer5];

	[layer5 addAnimation:a2 forKey:@"y"];
	[layer5 addAnimation:a3 forKey:@"z"];

	ZBGridLayer *layer6 = [[[ZBGridLayer alloc] init] autorelease];
	layer6.frame = CGRectMake(140.0, 260.0, 100.0, 100.0);
	layer6.image = [UIImage imageNamed:@"bike3.jpg"];
	[self.view.layer addSublayer:layer6];

	[layer6 addAnimation:a1 forKey:@"x"];
	[layer6 addAnimation:a3 forKey:@"z"];

	
}

@end

