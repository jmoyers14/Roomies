//
//  LogInViewController.m
//  Roomies
//
//  Created by Jeremy Moyers on 7/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LogInViewController.h"
#import "HomeViewController.h"
#import "ParseStarterProjectAppDelegate.h"
@interface LogInViewController ()

@end

@implementation LogInViewController
@synthesize facebook;


- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"view did load");
    //profilePicRequest = NO;
    profRequestComplete = NO;
    
    PFUser *currentUser = [PFUser currentUser];
    
    if(currentUser)
    {
        //the user is logged in
        NSLog(@"the user is logged in already");
       [currentUser refresh];
        userLoggedIn = YES;
    }
    else 
    {
        //new user, sign them up
        userLoggedIn = NO;
    }
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
/*
    if(userLoggedIn) {
        NSLog(@"the user is logged in");
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
        UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"TabBar"];
        [vc setModalPresentationStyle:UIModalPresentationFullScreen];
    
        [self presentModalViewController:vc animated:NO];
    }
 */
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


- (IBAction)logInWithFB:(id)sender
{
    NSArray *permissions = [NSArray arrayWithObjects:@"user_birthday", @"user_interests", @"user_location", @"email", @"user_photos", nil];
    
    [PFFacebookUtils logInWithPermissions:permissions block:^(PFUser *user, NSError *error) {
        if (!user) 
        {
            NSLog(@"Uh oh. The user cancelled the Facebook login.");
        } 
        else if (user.isNew) 
        {
            NSLog(@"The user is new");
            profPicRequestComplete = NO;
            self.facebook = [PFFacebookUtils facebookWithDelegate:self];
            profileRequest = [self.facebook requestWithGraphPath:@"me" andDelegate:self];
            profilePicRequest = [self.facebook requestWithGraphPath:@"me/picture?type=large" andDelegate:self]; 

        } 
        else 
        {
            NSLog(@"User logged in through Facebook!");
            PFUser *user = [PFUser currentUser];
            [user refresh];
            [self performSegueWithIdentifier:@"LoggingIn" sender:self];
        }
    }];
}


-(IBAction)segueBitch:(id)sender {
    NSLog(@"fucking button pressed");
    [self performSegueWithIdentifier:@"LoggingIn" sender:self];
}
#pragma mark - FB Session Callbacks

//All these stub methods required by FBSessionDelegate. Need FBSessionDelegate to do request. 
- (void)fbDidLogin {
    //Finished logging in, grab user data. 
}

- (void)fbDidNotLogin:(BOOL)cancelled {
    
}
- (void)fbDidLogout {
    
}

- (void)fbDidExtendToken:(NSString*)accessToken
               expiresAt:(NSDate*)expiresAt {
    
}

- (void)fbSessionInvalidated {
    
}

- (void) request:(PF_FBRequest *)request didLoad:(id)result
{
    PFUser *user = [PFUser currentUser];

    
    if(request == profileRequest)
    {
        NSLog(@"profileRequest complete");
        NSMutableDictionary *response = [[NSMutableDictionary alloc] initWithDictionary:result copyItems:YES];
        
        
        //create the person object associated with the new users account
        
        PFObject *person = [PFObject objectWithClassName:@"Person"];
        [person save];
        
        //set forgien keys n such yo. I cant spell.
        [user setObject:person.objectId forKey:@"person_id"];
        [person setObject:user.objectId forKey:@"user_id"];
        
        [person setObject:[response objectForKey:@"gender"] forKey:@"gender"];
        [person setObject:[response objectForKey:@"birthday"] forKey:@"birthday"];
        [person setObject:[response objectForKey:@"email"] forKey:@"email"];
        [person setObject:[response objectForKey:@"name"] forKey:@"name"];
    
        
        NSLog(@"saving person object");
        [person save];
        NSLog(@"person saved");

        NSLog(@"saving user");
        [user save];
        NSLog(@"user saved");
        profRequestComplete = YES;
    }
    else if (request == profilePicRequest)
    {

        PFQuery *query = [PFQuery queryWithClassName:@"Person"];        
        PFObject *person = [query getObjectWithId:[[PFUser currentUser] objectForKey:@"person_id"]];
        
        UIImage *image = [[UIImage alloc] initWithData:request.responseText];
        
        NSLog(@"Height = %f", image.size.height);
        NSLog(@"Width = %f", image.size.width);
        
        NSData *data = UIImagePNGRepresentation(image);
        
        
        NSLog(@"prof pic request is complete");
        PFFile *profileImage = [PFFile fileWithName:@"profilePicture" data:data];
        NSLog(@"begin saving prof pic");
        [profileImage save];
        NSLog(@"finished saving prof pic");
        [person setObject:profileImage forKey:@"profilePicture"];
        [person save];
        
        
        profPicRequestComplete = YES;

    }
    
    if(profPicRequestComplete && profRequestComplete) {
        [user save];
        NSLog(@"preform the segue in request did load");
        [self performSegueWithIdentifier:@"LoggingIn" sender:self];
    }
    
}


- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //this whole file needs cleaning.. queries on queries on stacks on stack on racks on racks.. hunnids
    PFQuery *query = [PFQuery queryWithClassName:@"Person"];
    PFObject *person = [query getObjectWithId:[[PFUser currentUser] objectForKey:@"person_id"]];
    ((ParseStarterProjectAppDelegate *)[[UIApplication sharedApplication] delegate]).myself = [[Person alloc] initWithPFObject:person];
    
    PFQuery *houseQuery = [PFQuery queryWithClassName:@"Person"];
    [houseQuery whereKey:@"house_id" equalTo:[person objectForKey:@"house_id"]];
    NSArray *houseArray = [houseQuery findObjects];
    
    ((ParseStarterProjectAppDelegate *)[[UIApplication sharedApplication] delegate]).house = [[NSMutableArray alloc] init];
    ((ParseStarterProjectAppDelegate *)[[UIApplication sharedApplication] delegate]).houseByPersonID = [[NSMutableDictionary alloc] init];
    
    for (PFObject *obj in houseArray) {
        
        Person *p = [[Person alloc] initWithPFObject:obj];
        
        [((ParseStarterProjectAppDelegate *)[[UIApplication sharedApplication] delegate]).house addObject:p];
        [((ParseStarterProjectAppDelegate *)[[UIApplication sharedApplication] delegate]).houseByPersonID setObject:p forKey:p.personID];
    }
}

- (void) preformSegueYouBitchFuck
{
    [self performSegueWithIdentifier:@"LoggingIn" sender:self];
}

@end
