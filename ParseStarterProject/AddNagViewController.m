//
//  AddNagViewController.m
//  Roomies
//
//  Created by Jeremy Moyers on 8/18/12.
//
//

#import "AddNagViewController.h"

@interface AddNagViewController ()

@end

@implementation AddNagViewController
@synthesize tableView;
@synthesize myself;
@synthesize houseMates;


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


#pragma - mark UITableViewDataSource

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.houseMates.count / 2;
}

- (UITableViewCell *) tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FaceGridCell *cell  = [aTableView dequeueReusableCellWithIdentifier:@"FaceGridCell"];
    if(cell == nil)
    {
        cell = [[FaceGridCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"FaceGridCell"];
    }
    
    int colOne = indexPath.row * 2;
    int colTwo = (indexPath.row * 2) + 1;
    
    
    cell.button1.tag = colOne;
    cell.button2.tag = colTwo;
    
    Person *personOne = (Person *)[houseMates objectAtIndex:colOne];
    Person *personTwo = (Person *)[houseMates objectAtIndex:colTwo];
    

    cell.person1.image = personOne.profPic;
    cell.person2.image = personTwo.profPic;


    return cell;
}

#pragma - mark UITableViewDelegate


- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 140;
}



- (IBAction)personSelected:(id)sender
{
    [self performSegueWithIdentifier:@"WriteNag" sender:sender];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"WriteNag"]) {
        
        UIButton *button = (UIButton *)sender;
        Person *p = [houseMates objectAtIndex:button.tag];
        NSLog(@"%@", p.name);
        ((WriteNagViewController *)segue.destinationViewController).naggedPerson = p;
        
    }
}








@end
