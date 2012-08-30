//
//  SortingCell.m
//  Roomies
//
//  Created by Jeremy Moyers on 8/2/12.
//
//

#import "SortingCell.h"

@implementation SortingCell
@synthesize name;
@synthesize facePic;
@synthesize up;
@synthesize down;

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
