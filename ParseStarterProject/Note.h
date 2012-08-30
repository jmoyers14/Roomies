//
//  Note.h
//  Roomies
//
//  Created by Jeremy Moyers on 8/13/12.
//
//

#import <Foundation/Foundation.h>
#import "Parse/Parse.h"

@interface Note : NSObject

@property (nonatomic, strong) NSString *poster;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *houseID;

- (id)initWithDictioanry:(NSDictionary *)dictionary;
- (id)initWithPFObject:(PFObject *)obj;
- (void) postStatus;

@end
