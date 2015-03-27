//
//  ProdutoTableViewCell.h
//  ER
//
//  Created by Leonardo Rodrigues de Morais Brunassi on 26/03/15.
//  Copyright (c) 2015 Vivian Chiodo Dias. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProdutoTableViewCell : UITableViewCell <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UILabel *prodLabel;
@property (weak, nonatomic) IBOutlet UITextField *registroProdTF;

@end
