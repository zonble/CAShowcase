#import "UIView+Screenshot.h"

@implementation UIView (Screenshot)

- (UIImage *)screenshot
{
	UIGraphicsBeginImageContext(self.bounds.size);
	[[UIColor clearColor] setFill];
	[[UIBezierPath bezierPathWithRect:self.bounds] fill];
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	[self.layer renderInContext:ctx];
	UIImage *anImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();	
	return anImage;
}

- (UIImage *)invertedScreenshot
{
	UIImage *image = [self screenshot];
	CIImage *ciImage = [CIImage imageWithCGImage:image.CGImage];	
	CIFilter *filter = [CIFilter filterWithName:@"CIColorInvert"];
	[filter setDefaults];
	[filter setValue:ciImage forKey:@"inputImage"];
	CIImage *output = [filter valueForKey:@"outputImage"];
	
	CIContext *context = [CIContext contextWithOptions:nil];
	return [UIImage imageWithCGImage:[context createCGImage:output fromRect:output.extent]];
}

@end
