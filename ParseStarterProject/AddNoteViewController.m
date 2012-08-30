//
//  AddNoteViewController.m
//  Roomies
//
//  Created by Jeremy Moyers on 8/13/12.
//
//

#import "AddNoteViewController.h"

@interface AddNoteViewController ()

@end

@implementation AddNoteViewController
@synthesize textView;
@synthesize myself;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.textView becomeFirstResponder];
    self.myself = ((ParseStarterProjectAppDelegate *)[[UIApplication sharedApplication] delegate]).myself;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma - mark UITextViewDelegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if([text isEqualToString:@"\n"])
    {
        NSLog(@"contentSize = %f", self.textView.contentSize.height);
        [self submitNoteWithHeight:self.textView.contentSize.height];
        int i = self.navigationController.viewControllers.count;
        [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:i-3] animated:YES];
        return NO;
    }
    return YES;
}

- (void) submitNoteWithHeight:(CGFloat)height
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    
    NSLog(@"%f", height);
    NSNumber *numba = [NSNumber numberWithFloat:height];
    [dict setObject:numba forKey:@"height"];
    [dict setObject:self.textView.text forKey:@"text"];
    [dict setObject:self.myself.personID forKey:@"poster"];
    [dict setObject:self.myself.houseID forKey:@"house_id"];
    
    Note *note = [[Note alloc] initWithDictioanry:dict];
    [note postStatus];
}

@end
