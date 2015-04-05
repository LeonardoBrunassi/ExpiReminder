//
//  DetalhesViewController.h
//  ER
//
//  Created by Leonardo Rodrigues de Morais Brunassi on 01/04/15.
//  Copyright (c) 2015 Vivian Chiodo Dias. All rights reserved.
//

#import "ViewController.h"
#import "Produto.h"
#import "ProdutoSingleton.h"
#import "FotoSingleton.h"

@interface DetalhesViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imagemProd;
@property (weak, nonatomic) IBOutlet UILabel *nomeProd;
@property (weak, nonatomic) IBOutlet UILabel *dataValida;
@property (weak, nonatomic) IBOutlet UILabel *diasFaltando;

@property ProdutoSingleton *ps;
@property FotoSingleton *fs;


//rafa
@property(strong, nonatomic)Produto *produto;

@end
