// Copyright 2011 Ping Labs, Inc. All rights reserved.

#import <UIKit/UIKit.h>
#import "RoomiesConstants.h"
#import "Person.h"
#import "SupplyInfoViewController.h"

@class ParseStarterProjectViewController;

@interface ParseStarterProjectAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, strong) IBOutlet UIWindow *window;
@property (nonatomic, strong) IBOutlet ParseStarterProjectViewController *viewController;
@property (nonatomic, strong) Person *myself;
@property (nonatomic, strong) NSMutableArray *house;
@property (nonatomic, strong) NSMutableDictionary *houseByPersonID;

- (void)subscribeFinished:(NSNumber *)result error:(NSError *)error;

@end
