//
//  RPLTableViewCell.m
//  EverPobre
//
//  Created by Raul Pedraza on 4/2/15.
//  Copyright (c) 2015 Raul Pedraza. All rights reserved.
//

#import "RPLTableViewCell.h"

@implementation RPLTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(NSString *) cellId{
    return NSStringFromClass(self);
}


+(CGFloat) cellHeight{
    return 44.0f;
    
}

@end
