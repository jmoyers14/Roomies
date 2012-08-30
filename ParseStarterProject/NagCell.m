//
//  NagCell.m
//  Roomies
//
//  Created by Jeremy Moyers on 8/19/12.
//
//

#import "NagCell.h"

@implementation NagCell
@synthesize person1;
@synthesize person2;
@synthesize background;
@synthesize text;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
