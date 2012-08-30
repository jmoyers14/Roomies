//
//  Supply.h
//  Roomies
//
//  Created by Jeremy Moyers on 8/4/12.
//
//

#import <Foundation/Foundation.h>
#import "Parse/Parse.h"

@interface Supply : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSArray *order;
@property (nonatomic, assign) BOOL inStock;
@property (nonatomic, strong) NSString *houseID;
@property (nonatomic, strong) NSString *supplyID;

-(id)initWithName:(NSString *)name houseID:(NSString *)hID andOrder:(NSArray *)order;
-(id)initWithPFObject:(PFObject *)obj;
- (void)postSupply;
- (void) updateStockTo:(BOOL)stock;
- (void) updateStockTo:(BOOL)stock andOrderTo:(NSArray *)newOrder;

@end
