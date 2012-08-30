//
//  WriteNagViewController.h
//  Roomies
//
//  Created by Jeremy Moyers on 8/19/12.
//
//

#import <UIKit/UIKit.h>
#import "ParseStarterProjectAppDelegate.h"
#import "Parse/Parse.h"
#import "Person.h"
#import "Nag.h"

@interface WriteNagViewController : UIViewController <UITextViewDelegate>

@property (nonatomic, strong) Person *naggedPerson;
@property (nonatomic, strong) IBOutlet UITextView *textView;
@property (nonatomic, strong) Person *myself;


- (void) submitNag;
@end
