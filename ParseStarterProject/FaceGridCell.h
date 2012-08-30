//
//  FaceGridCell.h
//  Roomies
//
//  Created by Jeremy Moyers on 8/19/12.
//
//

#import <UIKit/UIKit.h>

@interface FaceGridCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UIImageView* person1;
@property (nonatomic, strong) IBOutlet UIImageView* person2;
@property (nonatomic, strong) IBOutlet UIButton *button1;
@property (nonatomic, strong) IBOutlet UIButton *button2;



@end
