//
//  Person.m
//  Roomies
//
//  Created by Jeremy Moyers on 7/31/12.
//
//

#import "Person.h"

@implementation Person
@synthesize profPic;
@synthesize name;
@synthesize houseID;
@synthesize birthday;
@synthesize userID;
@synthesize gender;
@synthesize email;
@synthesize personID;


- (id) initWithPFObject:(PFObject *)obj
{
    self = [super init];
    
    if(self)
    {
        
        self.profPic  = [[UIImage alloc] initWithData:[[obj objectForKey:@"profilePicture"] getData]];
        self.personID = obj.objectId;
        self.name     = [obj objectForKey:@"name"];
        self.houseID  = [obj objectForKey:@"house_id"];
        self.birthday = [obj objectForKey:@"birthday"];
        self.userID   = [obj objectForKey:@"user_id"];
        self.gender   = [obj objectForKey:@"gender"];
        self.email    = [obj objectForKey:@"email"];
    }
    return self;
}




@end
