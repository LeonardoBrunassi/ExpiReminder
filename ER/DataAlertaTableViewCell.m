//
//  DataAlertaTableViewCell.m
//  ER
//
//  Created by André Helaehil on 31/03/15.
//  Copyright (c) 2015 Vivian Chiodo Dias. All rights reserved.
//

#import "DataAlertaTableViewCell.h"

@implementation DataAlertaTableViewCell

- (IBAction)daysSlider:(UISlider *)sender {
    if((int)sender.value == 1)
        _dia.text = @"Dia:";
    else
        _dia.text = @"Dias: ";
    
        
    _daysReminderLabel.text = [NSString stringWithFormat:@"%d", (int)sender.value];
}
@end
