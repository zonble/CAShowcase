#import "ZBGridControl.h"
#import "ZBGridLayer.h"

static NSUInteger itemsPerRow = 3;
static CGFloat itemHeight = 80.0;
static CGFloat itemWidth = 80.0;

@implementation ZBGridControl

- (void)dealloc
{
	self.delegate = nil;
	self.dataSource = nil;
	[layers release];
    [super dealloc];
}

- (void)tap:(UITapGestureRecognizer *)r
{
	if (selectedIndex != NSNotFound) {
		return;
	}
	
	CGPoint location = [r locationInView:self];
	NSUInteger index = 0;
	for (CALayer *aLayer in layers) {
		if (CGRectContainsPoint(aLayer.frame, location)) {
			selectedIndex = index;
			[dataSource gridContol:self didSelectItemAtIndex:index withLayer:aLayer];
			break;
		}
		index++;
	}
}

- (void)_init
{
	self.backgroundColor = [UIColor darkGrayColor];
	layers = [[NSMutableArray alloc] init];
	selectedIndex = NSNotFound;
	UITapGestureRecognizer *r = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
	[self addGestureRecognizer:r];
	[r release];
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

// - (void)drawRect:(CGRect)rect
// {
// 	// Drawing code
// 	// CGContextRef context = UIGraphicsGetCurrentContext();
// }


- (void)reloadData
{
	selectedIndex = NSNotFound;

	for (CALayer *aLayer in layers) {
		if (aLayer.superlayer) {
			[aLayer removeFromSuperlayer];
		}
	}
	[layers removeAllObjects];
	NSUInteger count = [dataSource numberOfItemsInGridControl:self];
	for (NSUInteger index = 0; index < count; index++) {
		ZBGridLayer *aLayer = [ZBGridLayer layer];
		aLayer.bounds = CGRectMake(0.0, 0.0, itemHeight, itemWidth);
		aLayer.image = [dataSource imageForItemInGridControl:self atIndex:index];
		[layers addObject:aLayer];
	}
	[self setNeedsLayout];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
	ZBGridLayer *aLayer = [layers objectAtIndex:selectedIndex];
	aLayer.contents = nil;
	aLayer.image = [dataSource imageForItemInGridControl:self atIndex:selectedIndex];
	[aLayer setNeedsDisplay];
	[aLayer removeAllAnimations];
	
	selectedIndex = NSNotFound;
	[self setNeedsLayout];
}

- (void)resetSelection
{
	ZBGridLayer *aLayer = [layers objectAtIndex:selectedIndex];
	[CATransaction begin];
	[CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
	aLayer.hidden = NO;
	CGRect frame = [self.layer convertRect:aLayer.frame fromLayer:aLayer.superlayer];
	[self.layer addSublayer:aLayer];
	aLayer.frame = frame;
	[CATransaction commit];
	
	NSUInteger k = itemsPerRow;
	CGFloat border = 60.0;
	if (self.bounds.size.width > self.bounds.size.height) {
		k += 1;
		border = 80.0;
	}
	NSUInteger rows = (NSUInteger)ceilf((float)[layers count] / (float)k);
	if (!rows) {
		rows = 1;
	}
	NSUInteger indexInRow = selectedIndex % k;
	NSUInteger row = selectedIndex / k;
	CGPoint position = CGPointMake(border + (indexInRow) * ((self.bounds.size.width - border * 2) / (k - 1)) , ((row + 0.5) * (itemHeight + 20.0)) + 10.0);

	CABasicAnimation *positionAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
	positionAnimation.fromValue = [NSValue valueWithCGPoint:[self.layer convertPoint:aLayer.position fromLayer:aLayer]];
	positionAnimation.toValue = [NSValue valueWithCGPoint:position];
	
	CABasicAnimation *boundsAnimation = [CABasicAnimation animationWithKeyPath:@"bounds"];
	boundsAnimation.fromValue = [NSValue valueWithCGRect:aLayer.bounds];
	boundsAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(0.0, 0.0, itemHeight, itemWidth)];
	
	CAAnimationGroup *group = [CAAnimationGroup animation];
	group.duration = 0.25;
	group.animations = [NSArray arrayWithObjects:positionAnimation, boundsAnimation, nil];
	group.delegate = self;
	group.fillMode = kCAFillModeForwards;
	group.removedOnCompletion = NO;
	[aLayer addAnimation:group forKey:@"zoomOut"];		
}

- (void)layoutSubviews
{
	NSUInteger index = 0;
	NSUInteger k = itemsPerRow;
	CGFloat border = 60.0;
	if (self.bounds.size.width > self.bounds.size.height) {
		k += 1;
		border = 80.0;
	}
	NSUInteger rows = (NSUInteger)ceilf((float)[layers count] / (float)k);
	if (!rows) {
		rows = 1;
	}
	self.contentSize = CGSizeMake(self.bounds.size.width, rows * (itemHeight + 20.0) + 20.0);
	
	for (ZBGridLayer *aLayer in layers) {
		if (index != selectedIndex) {
			NSUInteger indexInRow = index % k;
			NSUInteger row = index / k;
			aLayer.bounds = CGRectMake(0.0, 0.0, itemHeight, itemWidth);
			aLayer.position = CGPointMake(border + (indexInRow) * ((self.bounds.size.width - border * 2) / (k - 1)) , ((row + 0.5) * (itemHeight + 20.0)) + 10.0);
			if ([aLayer superlayer] != self.layer) {
				[self.layer addSublayer:aLayer];
			}
		}		
		index++;
	}
}

- (void)setFrame:(CGRect)frame
{
	[super setFrame:frame];
	[self setNeedsLayout];
}

- (void)setDataSource:(id<ZBGridControlDelegate>)inDataSource
{
	dataSource = inDataSource;
	[self reloadData];
}

- (id <ZBGridControlDelegate>)dataSource
{
	return dataSource;
}

@synthesize selectedIndex;

@end
