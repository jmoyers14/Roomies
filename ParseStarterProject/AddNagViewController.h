//
//  AddNagViewController.h
//  Roomies
//
//  Created by Jeremy Moyers on 8/18/12.
//
//

#import <UIKit/UIKit.h>
#import "ParseStarterProjectAppDelegate.h"
#import "WriteNagViewController.h"
#import "FaceGridCell.h"
#import "Person.h"

@interface AddNagViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) Person *myself;
@property (nonatomic, strong) NSMutableArray *houseMates;

- (IBAction)personSelected:(id)sender;

@end
