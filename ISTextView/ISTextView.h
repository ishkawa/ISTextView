#import <UIKit/UIKit.h>

@interface ISTextView : UITextView

@property (retain, nonatomic) UIView *shadowContainerView;
@property (retain, nonatomic) NSString *placeholder;
@property (retain, nonatomic) UIColor *placeholderTextColor;

@end
