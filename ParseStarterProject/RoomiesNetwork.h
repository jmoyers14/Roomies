//
//  RoomiesNetwork.h
//  Roomies
//
//  Created by Jeremy Moyers on 8/6/12.
//
//

#import <Foundation/Foundation.h>
#import "Supply.h"
#import "Parse/Parse.h"
#import "Note.h"
#import "Nag.h"

@interface RoomiesNetwork : NSObject

- (NSArray *)getSuppliesForHouse:(NSString*)houseID;
- (NSArray *)getNotesForHouse:(NSString *)houseID;
- (NSArray *)getNotesAndNagsForHouse:(NSString *)houseID;
- (NSArray *)getNagsForPerson:(NSString *)personID;

@end
