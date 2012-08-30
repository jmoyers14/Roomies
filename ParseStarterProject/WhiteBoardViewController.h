//
//  WhiteBoardViewController.h
//  Roomies
//
//  Created by Jeremy Moyers on 7/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParseStarterProjectAppDelegate.h"
#import "RoomiesConstants.h"
#import "PullToRefreshView.h"
#import "Note.h"
#import "NoteCell.h"
#import "NagCell.h"
#import "Person.h"
#import "RoomiesNetwork.h"

@interface WhiteBoardViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, PullToRefreshViewDelegate>
{
    PullToRefreshView *pull;
}

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *notes;
@property (nonatomic, strong) Person *myself;
@property (nonatomic, strong) NSMutableDictionary *houseMateDict;

-(void)add;

@end
