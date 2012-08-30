//
//  Person.h
//  Roomies
//
//  Created by Jeremy Moyers on 7/31/12.
//
//

#import <Foundation/Foundation.h>
#import "Parse/Parse.h"

@interface Person : NSObject


@property (nonatomic, strong) UIImage *profPic;
@property (nonatomic, strong) NSString *personID;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *houseID;
@property (nonatomic, strong) NSString *birthday;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) NSString *gender;
@property (nonatomic, strong) NSString *email;

- (id) initWithPFObject:(PFObject *)obj;

@end
