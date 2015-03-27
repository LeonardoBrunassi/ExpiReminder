//
//  ProdutoTableViewCell.m
//  ER
//
//  Created by Leonardo Rodrigues de Morais Brunassi on 26/03/15.
//  Copyright (c) 2015 Vivian Chiodo Dias. All rights reserved.
//

#import "ProdutoTableViewCell.h"

@implementation ProdutoTableViewCell
@synthesize registroProdTF;

- (void)awakeFromNib {
    registroProdTF.delegate = self;
    [registroProdTF setReturnKeyType:UIReturnKeyDone];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"deveria sumir");
   [textField resignFirstResponder];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
@end
