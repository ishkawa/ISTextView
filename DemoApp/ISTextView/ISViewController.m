#import "ISViewController.h"

@implementation ISViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.textView becomeFirstResponder];
}

- (void)viewDidUnload
{
    self.textView = nil;
    [super viewDidUnload];
}

- (void)dealloc
{
    self.textView = nil;
    [super dealloc];
}

@end
