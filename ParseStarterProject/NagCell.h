//
//  NagCell.h
//  Roomies
//
//  Created by Jeremy Moyers on 8/19/12.
//
//

#import <UIKit/UIKit.h>

@interface NagCell : UITableViewCell


@property (nonatomic, strong) IBOutlet UIImageView *background;
@property (nonatomic, strong) IBOutlet UIImageView *person1;
@property (nonatomic, strong) IBOutlet UIImageView *person2;
@property (nonatomic, strong) IBOutlet UITextView *text;

@end
