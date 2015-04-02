//
//  BarCodeViewController.h
//  ER
//
//  Created by Rafael  Hieda on 26/03/15.
//  Copyright (c) 2015 Vivian Chiodo Dias. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProdutoSingleton.h"

@class Produto;
@interface BarCodeViewController : UIViewController

@property ProdutoSingleton *produtoSingleton;
@property (strong, nonatomic) NSString *barCode;
//@property (nonatomic, strong) Produto *myProduct;
@end
