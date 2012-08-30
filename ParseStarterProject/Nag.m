//
//  Nag.m
//  Roomies
//
//  Created by Jeremy Moyers on 8/19/12.
//
//

#import "Nag.h"

@implementation Nag

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(self)
    {
        self.poster  = (NSString *)[dictionary objectForKey:@"poster"];
        self.text    = (NSString *)[dictionary objectForKey:@"text"];
        self.houseID = (NSString *)[dictionary objectForKey:@"house_id"];
        self.naggedPerson = (NSString *)[dictionary objectForKey:@"nagged_person"];
    }
    return self;
}

- (id)initWithPFObject:(PFObject *)obj
{
    self = [super init];
    if(self)
    {
        self.poster  = (NSString *)[obj objectForKey:@"poster"];
        self.text    = (NSString *)[obj objectForKey:@"text"];
        self.houseID = (NSString *)[obj objectForKey:@"house_id"];
        self.naggedPerson = (NSString *)[obj objectForKey: @"nagged_person"];
    }
    return self;
}

- (void)postNag
{
    //note and nags are stored in the same database table called "Note"
    PFObject *nag = [PFObject objectWithClassName:@"Note"];
    [nag setObject:self.poster forKey:@"poster"];
    [nag setObject:self.naggedPerson forKey:@"nagged_person"];
    [nag setObject:self.text forKey:@"text"];
    [nag setObject:self.houseID forKey:@"house_id"];
    [nag setObject:[NSNumber numberWithBool:NO] forKey:@"Note"];
    [nag save];
}



@end
