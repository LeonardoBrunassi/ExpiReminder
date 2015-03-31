//
//  ListaTableViewCell.h
//  ER
//
//  Created by Vivian Chiodo Dias on 30/03/15.
//  Copyright (c) 2015 Vivian Chiodo Dias. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListaTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *nome;
@property (weak, nonatomic) IBOutlet UILabel *diasFaltando;
@property (weak, nonatomic) IBOutlet UILabel *data;

@end
