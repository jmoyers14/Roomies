//
//  LogInViewController.h
//  Roomies
//
//  Created by Jeremy Moyers on 7/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Parse/Parse.h"
#import "Person.h"

@interface LogInViewController : UIViewController <PF_FBSessionDelegate, PF_FBRequestDelegate> {
    
    BOOL userLoggedIn;
    BOOL profPicRequestComplete;
    BOOL profRequestComplete;
    
    PF_FBRequest *profileRequest;
    PF_FBRequest *profilePicRequest;
    
}


@property (nonatomic, strong) PF_Facebook *facebook;


-(IBAction)segueBitch:(id)sender;
-(void)preformSegueYouBitchFuck;

@end
