//
//  SupplyCell.m
//  Roomies
//
//  Created by Jeremy Moyers on 7/24/12.
//
//

#import "SupplyCell.h"

@implementation SupplyCell
@synthesize nextBuyer;
@synthesize supplyName;
@synthesize imageView;



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
