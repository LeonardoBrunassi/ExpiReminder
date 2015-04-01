//
//  DataAlertaTableViewCell.h
//  ER
//
//  Created by André Helaehil on 31/03/15.
//  Copyright (c) 2015 Vivian Chiodo Dias. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataAlertaTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *daysReminderLabel;
- (IBAction)daysSlider:(UISlider *)sender;
@property (weak, nonatomic) IBOutlet UISlider *daysSlider;
@property (weak, nonatomic) IBOutlet UILabel *dia;

@end
