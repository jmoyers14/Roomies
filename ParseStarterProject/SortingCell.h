//
//  SortingCell.h
//  Roomies
//
//  Created by Jeremy Moyers on 8/2/12.
//
//

#import <UIKit/UIKit.h>


@interface SortingCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UILabel *name;
@property (nonatomic, strong) IBOutlet UIImageView *facePic;
@property (nonatomic, strong) IBOutlet UIButton *up;
@property (nonatomic, strong) IBOutlet UIButton *down;


@end
