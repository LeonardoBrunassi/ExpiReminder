//
//  DatePickerTableViewCell.m
//  ER
//
//  Created by Leonardo Rodrigues de Morais Brunassi on 26/03/15.
//  Copyright (c) 2015 Vivian Chiodo Dias. All rights reserved.
//

#import "DatePickerTableViewCell.h"

@implementation DatePickerTableViewCell

- (void)awakeFromNib {
    [_datePicker setDatePickerMode:UIDatePickerModeDate];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
