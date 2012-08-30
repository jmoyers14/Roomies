//
//  AddNoteViewController.h
//  Roomies
//
//  Created by Jeremy Moyers on 8/13/12.
//
//

#import <UIKit/UIKit.h>
#import "ParseStarterProjectAppDelegate.h"
#import "Person.h"
#import "Note.h"

@interface AddNoteViewController : UIViewController <UITextViewDelegate>

@property (nonatomic, strong) IBOutlet UITextView *textView;
@property (nonatomic, strong) Person *myself;

- (void) submitNoteWithHeight:(CGFloat)height;

@end
