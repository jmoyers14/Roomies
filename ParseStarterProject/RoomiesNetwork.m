//
//  RoomiesNetwork.m
//  Roomies
//
//  Created by Jeremy Moyers on 8/6/12.
//
//

#import "RoomiesNetwork.h"

@implementation RoomiesNetwork


- (NSArray *)getSuppliesForHouse:(NSString *)houseID {
    
    PFQuery *query = [[PFQuery alloc] initWithClassName:@"Supply"];
    [query whereKey:@"house_id" equalTo:houseID];
    NSArray *suppyObjs = [query findObjects];
    NSMutableArray *supplies = [[NSMutableArray alloc] init];
    
    for(PFObject *obj in suppyObjs) {
        [supplies addObject:[[Supply alloc] initWithPFObject:obj]];
    }
    
    return supplies;
}

- (NSArray *)getNotesForHouse:(NSString *)houseID {
    NSLog(@"houseID = %@", houseID);
    PFQuery *query = [[PFQuery alloc] initWithClassName:@"Note"];
    [query whereKey:@"house_id" equalTo:houseID];
    NSArray *noteObjs = [query findObjects];
    NSMutableArray *notes = [[NSMutableArray alloc] init];
    
    for(PFObject *obj in noteObjs)
    {
        [notes addObject:[[Note alloc] initWithPFObject:obj]];
        
    }
    return notes;
}

- (NSArray *)getNagsForPerson:(NSString *)personID
{
    PFQuery *query = [[PFQuery alloc] initWithClassName:@"Note"];
    [query whereKey:@"nagged_person" equalTo:personID];
    NSArray *nagObjs = [query findObjects];
    NSMutableArray *nags = [[NSMutableArray alloc]init];
    
    for(PFObject *obj in nagObjs)
    {
        [nags addObject:[[Nag alloc]initWithPFObject:obj]];
    }
    
    return nags;
}

- (NSArray *)getNotesAndNagsForHouse:(NSString *)houseID
{
    PFQuery *query = [[PFQuery alloc] initWithClassName:@"Note"];
    [query whereKey:@"house_id" equalTo:houseID];
    NSArray *noteObjs = [query findObjects];
    NSMutableArray *notes = [[NSMutableArray alloc] init];
    
    for (PFObject *obj in noteObjs)
    {
        if([[obj objectForKey:@"Note"] boolValue])
        {
            [notes addObject:[[Note alloc] initWithPFObject:obj]];
        }
        else
        {
            [notes addObject:[[Nag alloc] initWithPFObject:obj]];
        }
    }
    
    return notes;
}


@end
