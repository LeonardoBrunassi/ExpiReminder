//
//  DetalhesViewController.m
//  ER
//
//  Created by Leonardo Rodrigues de Morais Brunassi on 01/04/15.
//  Copyright (c) 2015 Vivian Chiodo Dias. All rights reserved.
//

#import "DetalhesViewController.h"

@interface DetalhesViewController ()

@end

@implementation DetalhesViewController
@synthesize ps, imagemProd, nomeProd, dataValida, diasFaltando, produto;
- (void)viewDidLoad {
    [super viewDidLoad];
//    nomeProd.text = produto.nome;
    [self.tabBarController setHidesBottomBarWhenPushed:YES];
    self.tabBarController.tabBar.hidden = YES;

    
    // Do any additional setup after loading the view.
}

- (void) viewWillAppear:(BOOL)animated {
 //   nomeProd.text = produto.nome;
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
