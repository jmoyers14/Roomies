//
//  TopHomeCard.m
//  Roomies
//
//  Created by Jeremy Moyers on 7/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TopHomeCard.h"

@implementation TopHomeCard
@synthesize profilePicture;
@synthesize fullName;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)moveOffScreen
{
    self.frame = CGRectMake(self.frame.origin.x, -self.frame.size.height, self.frame.size.width, self.frame.size.height);
}

- (void)moveDown
{
    self.frame = CGRectMake(self.frame.origin.x, 0.0, self.frame.size.width, self.frame.size.height);
}





/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
