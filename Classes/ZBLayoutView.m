#import "ZBLayoutView.h"

@implementation ZBLayoutView

- (void)dealloc 
{
	[currentTouch release];
	[rotateTimer invalidate];
	[rotateTimer release];
	[layers release];
    [super dealloc];
}

- (void)_init
{
	radius = 80.0;
	self.backgroundColor = [UIColor blackColor];
	layers = [[NSMutableArray alloc] init];
	NSUInteger count = 24;
	for (int i = 0; i < count; i++) {
		ZBLayoutLayer *aLayer = [ZBLayoutLayer layer];
		aLayer.color = [UIColor colorWithWhite:(0.5 + 0.5 * ((float)i/count)) alpha:1.0];
		aLayer.bounds = CGRectMake(0.0, 0.0, 15.0, 15.0);
		[layers addObject:aLayer];
	}
	[self setNeedsLayout];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self != nil) {
		[self _init];
	}
	return self;
}

- (id)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self != nil) {
		[self _init];
	}	
    return self;
}

- (void)timerMethod:(NSTimer *)t
{
	if (animationFlag) {
		if ((radius += 5) > 100) {
			animationFlag = NO;
		}			
	}
	else {
		if ((radius -= 5) < 60) {
			animationFlag = YES;
		}
	}
		
	if (++rotateIndex >= [layers count]) {
		rotateIndex = 0;
	}
	[self setNeedsLayout];
}

- (void)layoutSubviews
{
	if (self.currentTouch) {
		if (!rotateTimer) {
			rotateTimer = [[NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(timerMethod:) userInfo:nil repeats:YES] retain];
		}
		
		CGPoint p = [self.currentTouch locationInView:self];
		NSUInteger index = rotateIndex;
		for (ZBLayoutLayer *aLayer in layers) {
			CGFloat r = M_PI * 2 * index / [layers count];
			CGFloat x = p.x + cos(r) * radius * -1;
			CGFloat y = p.y + sin(r) * radius * -1;
			aLayer.position = CGPointMake(x, y);
			index++;
		}
		return;
	}
	
	radius = 80.0;
	
	if (rotateTimer) {
		rotateIndex = 0;
		[rotateTimer invalidate];
		[rotateTimer release];
		rotateTimer = nil;
	}
	
	NSUInteger index = 0;
	NSUInteger itemsPerRow = 4;
	NSUInteger rows = (NSUInteger)ceilf((float)[layers count] / (float)itemsPerRow);
	if (!rows) {
		rows = 1;
	}
	for (ZBLayoutLayer *aLayer in layers) {
		NSUInteger indexInRow = index % itemsPerRow;
		NSUInteger row = index / itemsPerRow;
		aLayer.position = CGPointMake((indexInRow + 1) * (self.bounds.size.width / (itemsPerRow  + 1)) ,
									  (row + 1) * (self.bounds.size.height / (rows +1)));
		if (![aLayer superlayer]) {
			[self.layer addSublayer:aLayer];
		}
		index++;
	}
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//	NSLog(@"%s", __PRETTY_FUNCTION__);
	self.currentTouch = [[touches allObjects] lastObject];
	[self setNeedsLayout];
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
//	NSLog(@"%s", __PRETTY_FUNCTION__);
	self.currentTouch = [[touches allObjects] lastObject];
	[self setNeedsLayout];
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
//	NSLog(@"%s", __PRETTY_FUNCTION__);
	self.currentTouch = nil;
	[self setNeedsLayout];
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
	self.currentTouch = nil;
	[self setNeedsLayout];
	NSLog(@"%s", __PRETTY_FUNCTION__);
}

@synthesize currentTouch;

@end
