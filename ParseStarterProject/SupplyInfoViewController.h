//
//  SupplyInfoViewController.h
//  Roomies
//
//  Created by Jeremy Moyers on 8/6/12.
//
//

#import <UIKit/UIKit.h>
#import "Parse/Parse.h"
#import "Supply.h"

@interface SupplyInfoViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) Supply *supply;
@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) IBOutlet UIButton *theButton;


- (IBAction)buttonPressed:(id)sender;
@end
