//
//  TopHomeCard.h
//  Roomies
//
//  Created by Jeremy Moyers on 7/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TopHomeCard : UIView

@property(strong, nonatomic) IBOutlet UIImageView *profilePicture;
@property(strong, nonatomic) IBOutlet UILabel *fullName;

- (void)moveDown;
- (void)moveOffScreen;


@end
