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

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *addProdutos;
@property (weak, nonatomic) Produto *produto;
@property (weak, nonatomic) ProdutoSingleton *singleton;
@end

