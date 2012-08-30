//
//  WriteNagViewController.m
//  Roomies
//
//  Created by Jeremy Moyers on 8/19/12.
//
//

#import "WriteNagViewController.h"

@interface WriteNagViewController ()

@end

@implementation WriteNagViewController
@synthesize naggedPerson;
@synthesize textView;
@synthesize myself;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.textView becomeFirstResponder];
   // self.houseMates = ((ParseStarterProjectAppDelegate *)[[UIApplication sharedApplication] delegate]).house;
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

- (void) submitNag
{
    NSLog(@"Nag submitted");
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    
    [dict setObject:self.myself.personID forKey:@"poster"];
    [dict setObject:self.textView.text forKey:@"text"];
    [dict setObject:self.myself.houseID forKey:@"house_id"];
    [dict setObject:self.naggedPerson.personID forKey:@"nagged_person"];
    
    Nag *nag = [[Nag alloc] initWithDictionary:dict];
    
    [nag postNag];
}

#pragma - mark UITextViewDelegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if([text isEqualToString:@"\n"])
    {
        NSLog(@"contentSize = %f", self.textView.contentSize.height);
        [self submitNag];
        int i = self.navigationController.viewControllers.count;
        [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:i-4] animated:YES];
        return NO;
    }
    return YES;
}


@end
