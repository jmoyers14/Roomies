//
//  SuppliesViewController.h
//  Roomies
//
//  Created by Jeremy Moyers on 7/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParseStarterProjectAppDelegate.h"
#import "SupplyCell.h"
#import "Supply.h"
#import "Person.h"
#import "RoomiesNetwork.h"
#import "SupplyInfoViewController.h"
#import "PullToRefreshView.h"

@interface SuppliesViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, PullToRefreshViewDelegate>
{
    PullToRefreshView *pull;
}

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) IBOutlet Person *myself;
@property (nonatomic, strong) NSArray *supplies;

- (void)add;

@end
