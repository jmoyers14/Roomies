//
//  Nag.h
//  Roomies
//
//  Created by Jeremy Moyers on 8/19/12.
//
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Parse/Parse.h"

@interface Nag : NSObject

@property (nonatomic, strong) NSString *poster;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *naggedPerson;
@property (nonatomic, strong) NSString *houseID;

- (id)initWithDictionary:(NSDictionary *)dictionary;
- (id)initWithPFObject:(PFObject *)obj;
- (void) postNag;

@end
