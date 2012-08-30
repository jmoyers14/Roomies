//
//  WhiteBoardViewController.m
//  Roomies
//
//  Created by Jeremy Moyers on 7/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WhiteBoardViewController.h"

@interface WhiteBoardViewController ()

@end

@implementation WhiteBoardViewController
@synthesize tableView;
@synthesize notes;
@synthesize myself;
@synthesize houseMateDict;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated {

    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //set up custom right bar button
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(add)];
    self.myself = ((ParseStarterProjectAppDelegate *)[[UIApplication sharedApplication] delegate]).myself;
    self.houseMateDict = ((ParseStarterProjectAppDelegate *)[[UIApplication sharedApplication] delegate]).houseByPersonID;

    pull = [[PullToRefreshView alloc] initWithScrollView:(UIScrollView *) self.tableView];
    [pull setDelegate:self];
    [self.tableView addSubview:pull];
    
    //load data for the first time.. will take a while.. well figue something out
    RoomiesNetwork *network = [[RoomiesNetwork alloc] init];
    self.notes = [network getNotesAndNagsForHouse:self.myself.houseID];
    [self.tableView reloadData];
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
    [self performSegueWithIdentifier:@"FirstAdd" sender:self.navigationItem.rightBarButtonItem];
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
    self.notes = [network getNotesAndNagsForHouse:self.myself.houseID];
    [self.tableView reloadData];
    [pull finishedLoading];
}

#pragma mark UITableViewDataSource

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.notes.count;
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int index = self.notes.count;
    index -= 1;
    index -= indexPath.row;
    
    if([[self.notes objectAtIndex:index] isKindOfClass:[Note class]])
    {

        NoteCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"NoteCell"];
        if(cell == nil)
        {
            cell = [[NoteCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"NoteCell"];
        }
        
        //int index = self.notes.count;
        //index -= 1;
        
        Note *note = [self.notes objectAtIndex:index];
        Person *p = (Person *)[self.houseMateDict objectForKey:note.poster];
        
        cell.textView.text = note.text;
        cell.face.image = p.profPic;
        cell.textView.frame = CGRectMake(cell.textView.frame.origin.x, cell.textView.frame.origin.y, cell.textView.frame.size.width, note.height + 15);
        
        return cell;
        
    }
    else
    {
        
        NSLog(@"Cell number %d is a Nag", index);
        
        NagCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"NagCell"];
        if(cell == nil)
        {
            cell = [[NagCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"NagCell"];
        }
        
        Nag *nag = [self.notes objectAtIndex:index];
        Person *p1 = (Person *)[self.houseMateDict objectForKey:nag.poster];
        Person *p2 = (Person *)[self.houseMateDict objectForKey:nag.naggedPerson];
        
        cell.person1.image = p1.profPic;
        cell.person2.image = p2.profPic;
        cell.text.text = nag.text;
        
        return cell;
    }
    
    

}

#pragma mark UITableViewDelegate

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    int index = self.notes.count;
    index -= 1;
    index -= indexPath.row;
    
    if([[self.notes objectAtIndex:index] isKindOfClass:[Note class]])
    {
        Note *n = (Note *)[self.notes objectAtIndex:index];
        
        if(n.height < 60)
            return 70;
        else
            return (n.height + 35);
    }
    else
    {
        return 120;
    }
    

}




@end
