//
//  BottomHomeCard.m
//  Roomies
//
//  Created by Jeremy Moyers on 7/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BottomHomeCard.h"

@implementation BottomHomeCard

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
    self.frame = CGRectMake(self.frame.origin.x, 367.0, self.frame.size.width, self.frame.size.height);
}

- (void)moveUp
{
    self.frame = CGRectMake(self.frame.origin.x, 157.0, self.frame.size.width, self.frame.size.height);
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
