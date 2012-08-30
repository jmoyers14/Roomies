//
//  FaceGridCell.m
//  Roomies
//
//  Created by Jeremy Moyers on 8/19/12.
//
//

#import "FaceGridCell.h"

@implementation FaceGridCell
@synthesize person2;
@synthesize person1;
@synthesize button1;
@synthesize button2;



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
