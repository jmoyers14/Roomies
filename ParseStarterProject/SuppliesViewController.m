//
//  SuppliesViewController.m
//  Roomies
//
//  Created by Jeremy Moyers on 7/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SuppliesViewController.h"

@interface SuppliesViewController ()

@end

@implementation SuppliesViewController
@synthesize tableView;
@synthesize myself;
@synthesize supplies;


- (void)viewDidLoad
{
    NSLog(@"view did load");
    [super viewDidLoad];
	    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add)];
    
    self.myself = ((ParseStarterProjectAppDelegate *)[[UIApplication sharedApplication] delegate]).myself;
    
    //set up pull view
    pull = [[PullToRefreshView alloc] initWithScrollView:(UIScrollView *) self.tableView];
    [pull setDelegate:self];
    [self.tableView addSubview:pull];
    
    //do the initial data pull
    RoomiesNetwork *network = [[RoomiesNetwork alloc] init];
    self.supplies = [network getSuppliesForHouse:myself.houseID];
    [self.tableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"Roomies_Header.png"] forBarMetrics:UIBarMetricsDefault];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)add 
{
    [self performSegueWithIdentifier:@"AddSupply" sender:self];
}

#pragma mark PullToRefreshDelegate



- (void)pullToRefreshViewShouldRefresh:(PullToRefreshView *)view;
{
    //[self performSelectorInBackground:@selector(reloadTableData) withObject:nil];
    [self reloadTableData];
}

-(void) reloadTableData
{
    RoomiesNetwork *network = [[RoomiesNetwork alloc] init];
    self.supplies = [network getSuppliesForHouse:myself.houseID];
    [self.tableView reloadData];
    [pull finishedLoading];
}

#pragma mark - UITableViewDataScource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.supplies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    SupplyCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"SupplyCell"];
    if(cell == nil)
    {
        cell = [[SupplyCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SupplyCell"];
    }
  
    
    int index = self.supplies.count;
    index -= 1;
    
    Supply *supply = (Supply *)[supplies objectAtIndex:index - indexPath.row];
    
    cell.supplyName.text = supply.name;
    cell.nextBuyer.text = (NSString *)[supply.order objectAtIndex:0];
    
    if(supply.inStock)
    {
        cell.background.image = [UIImage imageNamed:@"Supply_Button_Green@2x.png"];
    }
    else
    {
        cell.background.image = [UIImage imageNamed:@"Supply_Button_Red@2x.png"];
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger index = self.supplies.count;
    index -= 1;
    Supply *supply = [supplies objectAtIndex:index - indexPath.row];
    [self performSegueWithIdentifier:@"SupplyInfo" sender:supply];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.destinationViewController isKindOfClass:[SupplyInfoViewController class]])
    {
        Supply *supply = (Supply *)sender;
        ((SupplyInfoViewController *)[segue destinationViewController]).supply = supply;
    }
}


@end
