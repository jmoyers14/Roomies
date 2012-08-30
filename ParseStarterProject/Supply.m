//
//  Supply.m
//  Roomies
//
//  Created by Jeremy Moyers on 8/4/12.
//
//

#import "Supply.h"

@implementation Supply
@synthesize supplyID;
@synthesize order;
@synthesize name;
@synthesize inStock;
@synthesize houseID;

-(id)initWithName:(NSString *)aName houseID:(NSString *)hID andOrder:(NSArray *)aOrder
{
    self = [super init];
    if(self)
    {
        self.name = aName;
        self.order = aOrder;
        self.inStock = YES;
        self.houseID = hID;
    }
    return self;
}

-(id)initWithPFObject:(PFObject *)obj
{
    self = [super init];
    if(self)
    {
        self.supplyID = obj.objectId;
        self.name = [obj objectForKey:@"name"];
        self.order = [obj objectForKey:@"order"];
        self.houseID = [obj objectForKey:@"house_id"];
        self.inStock = [[obj objectForKey:@"in_stock"] boolValue];
    }
    return self;
}

- (void)postSupply
{
    PFObject *supply = [PFObject objectWithClassName:@"Supply"];
    [supply setObject:self.name forKey:@"name"];
    [supply setObject:self.order forKey:@"order"];
    [supply setObject:[NSNumber numberWithBool:self.inStock] forKey:@"in_stock"];
    [supply setObject:self.houseID forKey:@"house_id"];
    [supply save];
}

-(void)updateStockTo:(BOOL)stock
{
    PFQuery *supQ = [[PFQuery alloc] initWithClassName:@"Supply"];
    [supQ whereKey:@"objectId" equalTo:self.supplyID];
    NSArray *obj = [supQ findObjects];
    PFObject *o = [obj objectAtIndex:0];
    [o setObject:[NSNumber numberWithBool:stock] forKey:@"in_stock"];
    [o save];
}

- (void) updateStockTo:(BOOL)stock andOrderTo:(NSArray *)newOrder
{
    self.order = newOrder;
    PFQuery *supQ = [[PFQuery alloc] initWithClassName:@"Supply"];
    NSLog(@"self.supplyID");
    [supQ whereKey:@"objectId" equalTo:self.supplyID];
    NSArray *obj = [supQ findObjects];
    PFObject *o = [obj objectAtIndex:0];
    [o setObject:newOrder forKey:@"order"];
    [o setObject:[NSNumber numberWithBool:stock] forKey:@"in_stock"];
    [o save];
}


@end
