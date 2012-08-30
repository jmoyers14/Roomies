//
//  AddSupplyViewController.h
//  Roomies
//
//  Created by Jeremy Moyers on 8/2/12.
//
//

#import <UIKit/UIKit.h>
#import "SortingCell.h"
#import "ParseStarterProjectAppDelegate.h"
#import "Person.h"
#import "Supply.h"

@interface AddSupplyViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *houseMates;
@property (nonatomic, strong) IBOutlet UITextField *supplyName;
@property (nonatomic, strong) Person *myself;

- (IBAction)upButtonPressed:(id)sender;
- (IBAction)downButtonPressed:(id)sender;
- (IBAction)submitButtonPressed:(id)sender;
@end
