//
//  AddSupplyViewController.m
//  Roomies
//
//  Created by Jeremy Moyers on 8/2/12.
//
//

#import "AddSupplyViewController.h"

@interface AddSupplyViewController ()

@end

@implementation AddSupplyViewController
@synthesize houseMates;
@synthesize tableView;
@synthesize supplyName;
@synthesize myself;

- (void)viewDidLoad
{
    [super viewDidLoad];
      
    self.houseMates = ((ParseStarterProjectAppDelegate *)[[UIApplication sharedApplication] delegate]).house;
    self.myself = ((ParseStarterProjectAppDelegate *)[[UIApplication sharedApplication] delegate]).myself;
    
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

- (IBAction)upButtonPressed:(id)sender
{
    UIButton *button = (UIButton *)sender;
    NSLog(@"tag = %d", button.tag);
    
    int index = button.tag-1;
    
    if(index > 0)
    {
        [self.houseMates exchangeObjectAtIndex:index withObjectAtIndex:index-1];
        
    }
    else
    {
        //[self.houseMates exchangeObjectAtIndex:0 withObjectAtIndex:houseMates.count-1];
    }
    
    [self.tableView reloadData];
    
}

- (IBAction)submitButtonPressed:(id)sender
{
    
    NSMutableArray *names = [[NSMutableArray alloc] init];
    for (Person *p in self.houseMates) {
        [names addObject:p.name];
    }
    
    NSArray *order = [[NSArray alloc] initWithArray:names];
    

    Supply *supply = [[Supply alloc] initWithName:self.supplyName.text houseID:self.myself.houseID andOrder:order];
    [supply postSupply];
        
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)downButtonPressed:(id)sender
{
    UIButton *button = (UIButton *)sender;
    NSLog(@"tag = %d", button.tag);
    
    int index = button.tag;
    index = index * -1;
    index -= 1;
    
    
    if(index < self.houseMates.count-1)
    {
        [self.houseMates exchangeObjectAtIndex:index withObjectAtIndex:index+1];
        
    }
    else
    {
        //[self.houseMates exchangeObjectAtIndex:0 withObjectAtIndex:houseMates.count-1];
    }
    
    [self.tableView reloadData];
}


#pragma - mark UITableViewDataScource


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.houseMates.count;
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{    
    SortingCell *cell  = [aTableView dequeueReusableCellWithIdentifier:@"SortingCell"];
    if(cell == nil)
    {
        cell = [[SortingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SortingCell"];
    }
    
    
    Person *person = (Person *)[houseMates objectAtIndex:indexPath.row];
    cell.name.text = person.name;
    cell.facePic.image = person.profPic;

    cell.up.tag = indexPath.row + 1;
    cell.down.tag = -1 * (indexPath.row + 1);
    
    
    
    return cell;
}



#pragma - mark UITableViewDelegate



#pragma - mark UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if([string isEqualToString:@"\n"])
    {
        NSLog(@"resign first responder");
        [self.supplyName resignFirstResponder];
    }
    return YES;
}

@end
