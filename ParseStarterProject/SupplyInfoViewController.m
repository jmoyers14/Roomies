//
//  SupplyInfoViewController.m
//  Roomies
//
//  Created by Jeremy Moyers on 8/6/12.
//
//

#import "SupplyInfoViewController.h"

@interface SupplyInfoViewController ()

@end

@implementation SupplyInfoViewController
@synthesize supply;
@synthesize tableView;
@synthesize theButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UILabel *label;
    label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:20.0];
    label.textAlignment = UITextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    self.navigationItem.titleView = label;
    label.text = self.supply.name;
    [label sizeToFit];
    
    NSLog(@"id = %@", self.supply.supplyID);
    if(self.supply.inStock)
    {
        [self.theButton setBackgroundImage:[UIImage imageNamed:@"Supply_Out_Button@2x.png"] forState:UIControlStateNormal];
    }
    else
    {
        [self.theButton setBackgroundImage:[UIImage imageNamed:@"Purchased_Button@2x.png"] forState:UIControlStateNormal];
    }
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Roomies_Header_Black.png"] forBarMetrics:UIBarMetricsDefault];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];


}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark - UITableViewDataSource

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.supply.order.count;
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:@"NameCell"];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"NameCell"];
    }
    
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.textLabel.text = [NSString stringWithFormat:@"%d. %@", indexPath.row, (NSString *)[supply.order objectAtIndex:indexPath.row]];

    
    
    return cell;
}


- (IBAction)buttonPressed:(id)sender
{
    if(self.supply.inStock)
    {
        [self.supply updateStockTo:NO];
        [self.theButton setBackgroundImage:[UIImage imageNamed:@"Purchased_Button@2x.png"] forState:UIControlStateNormal];
    }
    else
    {
        [self.supply updateStockTo:YES];

        NSMutableArray *newOrder = [[NSMutableArray alloc] init];
        for(int i = 0; i < supply.order.count;i++)
        {
            if(i == 0) {
                //DO NOTHING YO
            }
            else
            {
                [newOrder addObject:[supply.order objectAtIndex:i]];
            }
        }
        [newOrder addObject:[supply.order objectAtIndex:0]];
        NSArray *finalOrder = [[NSArray alloc] initWithArray:newOrder];
        [supply updateStockTo:YES andOrderTo:finalOrder];
        [self.tableView reloadData];
        [self.theButton setBackgroundImage:[UIImage imageNamed:@"Supply_Out_Button@2x.png"] forState:UIControlStateNormal];
    }
}

@end
