//
//  ViewController.h
//  ER
//
//  Created by Vivian Chiodo Dias on 25/03/15.
//  Copyright (c) 2015 Vivian Chiodo Dias. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Produto.h"
#import "ProdutoSingleton.h"
#import "ListaTableViewCell.h"
#import "DetalhesViewController.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addProdutos;
@property (strong, nonatomic) Produto *produto;
@property (weak, nonatomic) ProdutoSingleton *singleton;
@end

