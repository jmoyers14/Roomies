//
//  Note.m
//  Roomies
//
//  Created by Jeremy Moyers on 8/13/12.
//
//

#import "Note.h"

@implementation Note
@synthesize height;
@synthesize poster;
@synthesize text;
@synthesize houseID;

- (id)initWithDictioanry:(NSDictionary *)dictionary
{
    self = [super init];
    if(self)
    {
        self.height = [[dictionary objectForKey:@"height"] floatValue];
        self.poster = (NSString *)[dictionary objectForKey:@"poster"];
        self.text   = (NSString *)[dictionary objectForKey:@"text"];
        self.houseID = (NSString *)[dictionary objectForKey:@"house_id"];
    }
    return self;
}

- (id)initWithPFObject:(PFObject *)obj
{
    self = [super init];
    if(self)
    {
        self.height = [[obj objectForKey:@"height"] floatValue];
        self.poster = (NSString *)[obj objectForKey:@"poster"];
        self.text   = (NSString *)[obj objectForKey:@"text"];
        self.houseID = (NSString *)[obj objectForKey:@"house_id"];

    }
    return self;
}

- (void)postStatus
{
    NSLog(@"%f", self.height);
    PFObject *status = [PFObject objectWithClassName:@"Note"];
    NSNumber *numba = [NSNumber numberWithFloat:self.height];
    [status setObject:numba forKey:@"height"];
    [status setObject:self.poster forKey:@"poster"];
    [status setObject:self.text forKey:@"text"];
    [status setObject:self.houseID forKey:@"house_id"];
    [status setObject:[NSNumber numberWithBool:YES] forKey:@"Note"];
    [status save];
}

@end
