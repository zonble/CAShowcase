//
//  ZBBananaLayer.m
//  Banana
//

#import "ZBBananaLayer.h"


@implementation ZBBananaLayer

- (void)dealloc
{
	[animationTimer invalidate];
}

- (void)timer:(NSTimer *)timer
{
	if (!self.superlayer) {
		return;
	}
	
	if (self.hidden) {
		return;
	}
	
	imageIndex++;
	if (imageIndex >= images.count) {
		imageIndex = 0;
	}
	UIImage *image = images[imageIndex];
	self.contents = (id)image.CGImage;
}

- (instancetype)init
{
	self = [super init];
	if (self != nil) {
		images = @[[UIImage imageNamed:@"banana1.tiff"],
				  [UIImage imageNamed:@"banana2.tiff"],
				  [UIImage imageNamed:@"banana3.tiff"],
				  [UIImage imageNamed:@"banana4.tiff"],
				  [UIImage imageNamed:@"banana5.tiff"],
				  [UIImage imageNamed:@"banana6.tiff"],
				  [UIImage imageNamed:@"banana7.tiff"],
				  [UIImage imageNamed:@"banana8.tiff"]];
		UIImage *firstImage = images[0];
		self.contents = (id)firstImage.CGImage;
		animationTimer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timer:) userInfo:nil repeats:YES];
	}
	return self;
}



@end
