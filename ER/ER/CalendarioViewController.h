//
//  CalendarioViewController.h
//  ER
//
//  Created by Leonardo Rodrigues de Morais Brunassi on 25/03/15.
//  Copyright (c) 2015 Vivian Chiodo Dias. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalendarioTableViewCell.h"
#import "Produto.h"
#import "ProdutoSingleton.h"

@interface CalendarioViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UIView *calendario;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) ProdutoSingleton *singleton;

@end

