//
//  ListaTableViewCell.m
//  ER
//
//  Created by Vivian Chiodo Dias on 30/03/15.
//  Copyright (c) 2015 Vivian Chiodo Dias. All rights reserved.
//

#import "ListaTableViewCell.h"

@implementation ListaTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"detalhes"]){
        NSIndexPath *indexPath = [self.tableView indexPathsForSelectedRows];
        DetalhesViewController *detalheVC = segue.destinationViewController;
        long row = [indexPath row];
        NSLog(@"%lu:", row);
        NSArray *aux = [NSArray arrayWithObjects:[[_singleton retornoProd] objectAtIndex:row], nil];
        detalheVC.prod = aux;
    }
}

@end
