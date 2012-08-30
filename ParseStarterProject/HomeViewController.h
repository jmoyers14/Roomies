//
//  HomeViewController.h
//  Roomies
//
//  Created by Jeremy Moyers on 7/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "TopHomeCard.h"
#import "BottomHomeCard.h"
#import "Person.h"
#import "ParseStarterProjectAppDelegate.h"
#import "Nag.h"
#import "RoomiesNetwork.h"

@interface HomeViewController : UIViewController



@property (strong, nonatomic) IBOutlet TopHomeCard *topCard;
@property (strong, nonatomic) IBOutlet BottomHomeCard *bottomCard;
@property (strong, nonatomic) IBOutlet UIImageView *triangle;
@property (strong, nonatomic) NSMutableArray *houseMates;
@property (strong, nonatomic) NSArray *nags;
@property (strong, nonatomic) Person *myself;

- (IBAction)buttonPressed:(id)sender;

@end
