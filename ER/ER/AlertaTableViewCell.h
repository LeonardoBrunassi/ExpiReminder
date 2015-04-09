//
//  AlertaTableViewCell.h
//  ER
//
//  Created by André Helaehil on 31/03/15.
//  Copyright (c) 2015 Vivian Chiodo Dias. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UsuarioSingleton.h"

@interface AlertaTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UISwitch *interruptor;
- (IBAction)alterarConfiguracoes:(UIButton *)sender;
@end
