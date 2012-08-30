//
//  HomeViewController.m
//  Roomies
//
//  Created by Jeremy Moyers on 7/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController
@synthesize bottomCard;
@synthesize topCard;
@synthesize triangle;
@synthesize houseMates;
@synthesize nags;
@synthesize myself;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    //init With top card off of the screen
    [self.topCard moveOffScreen];
    [self.bottomCard moveOffScreen];
    //PFUser *user = [PFUser currentUser];

    self.triangle.frame = CGRectMake(self.triangle.frame.origin.x, 357, self.triangle.frame.size.width, self.triangle.frame.size.height);
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.25];
    [UIView setAnimationDelay:0.0];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    
    [topCard moveDown];
    topCard.profilePicture.image = self.myself.profPic;
    topCard.fullName.text = self.myself.name;
    
    self.triangle.frame = CGRectMake(self.triangle.frame.origin.x, 148, self.triangle.frame.size.width, self.triangle.frame.size.height);
    
    
    [bottomCard moveUp];
    
    [UIView commitAnimations];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.myself =  ((ParseStarterProjectAppDelegate *)[[UIApplication sharedApplication] delegate]).myself;

    houseMates = ((ParseStarterProjectAppDelegate *)[[UIApplication sharedApplication] delegate]).house;
    
    RoomiesNetwork *network = [[RoomiesNetwork alloc] init];
    
    self.nags = [network getNagsForPerson:self.myself.personID];
    
    for(Nag *n in nags)
    {
        NSLog(@"%@", n.text);
    }
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

- (IBAction)buttonPressed:(id)sender
{
    CGRect left = CGRectMake(76.0, 148.0, self.triangle.frame.size.width, self.triangle.frame.size.height);
    CGRect right = CGRectMake(206.0, 148.0, self.triangle.frame.size.width, self.triangle.frame.size.height);
    
    CGRect triangleFrame;
    if(((UIButton *)sender).tag == 0)
    {
        triangleFrame = left;
    }
    else if(((UIButton *)sender).tag == 1)
    {
        triangleFrame = right;
    }
    
    //triangle animation
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.25];
    [UIView setAnimationDelay:0.0];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    self.triangle.frame = triangleFrame;
    [bottomCard moveUp];
    
    [UIView commitAnimations];
    
    
}

@end
