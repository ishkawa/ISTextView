#import "ISTextView.h"
#import <QuartzCore/QuartzCore.h>

@implementation ISTextView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialize];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize
{
    self.layer.cornerRadius = 6.f;
    self.clipsToBounds = YES;
    self.contentInset = UIEdgeInsetsMake(-.8f, -.8f, -.8f, -.8f);
    self.textAlignment = UITextAlignmentLeft;
}

- (void)drawRect:(CGRect)rect
{
    if (self.shadowContainerView) {
        [self.shadowContainerView removeFromSuperview];
    }
    self.shadowContainerView = [[[UIView alloc] init] autorelease];
    self.shadowContainerView.frame = self.frame;
    self.shadowContainerView.autoresizingMask = (UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight);
    self.shadowContainerView.layer.masksToBounds = YES;
    self.shadowContainerView.layer.cornerRadius = 6.f;
    [self.superview addSubview:self.shadowContainerView];
    
    NSMutableArray *layers = [NSMutableArray array];
    
    CALayer *layer1 = [CALayer layer];
    layer1.frame = CGRectMake(-3, -3, self.frame.size.width+10, 3);
    layer1.shadowOffset = CGSizeMake(0, 0);
    [layers addObject:layer1];
    
    CALayer *layer2 = [CALayer layer];
    layer2.frame = CGRectMake(-5, self.frame.size.height+5, self.frame.size.width+10, 5);
    layer2.shadowOffset = CGSizeMake(2.5, -2.5);
    [layers addObject:layer2];
    
    CALayer *layer3 = [CALayer layer];
    layer3.frame = CGRectMake(-3, -3, 3, self.frame.size.height+10);
    layer3.shadowOffset = CGSizeMake(0, 0);
    [layers addObject:layer3];
    
    CALayer *layer4 = [CALayer layer];
    layer4.frame = CGRectMake(self.frame.size.width+5, -5, 5, self.frame.size.height+10);
    layer4.shadowOffset = CGSizeMake(-2.5, 2.5);
    [layers addObject:layer4];
    
    for (CALayer *layer in layers) {
        layer.shadowColor = [UIColor blackColor].CGColor;
        layer.shadowOpacity = 1.f;
        layer.backgroundColor = [UIColor whiteColor].CGColor;
        
        [self.shadowContainerView.layer addSublayer:layer];
    }
}

@end
