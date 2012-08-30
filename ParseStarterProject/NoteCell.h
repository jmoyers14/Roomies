//
//  NoteCell.h
//  Roomies
//
//  Created by Jeremy Moyers on 7/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NoteCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UITextView* textView;
@property (nonatomic, strong) IBOutlet UIImageView* face;


@end
