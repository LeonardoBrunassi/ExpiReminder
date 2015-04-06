//
//  ViewController.m
//  ER
//
//  Created by Vivian Chiodo Dias on 25/03/15.
//  Copyright (c) 2015 Vivian Chiodo Dias. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize tableView;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Produtos";
    self.navigationItem.title = @"Produtos";
    _singleton = [ProdutoSingleton instance];
    _produto = [[Produto alloc]init];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
   [[[[self.tabBarController tabBar]items]objectAtIndex:1]setEnabled:FALSE];
 

}

-(void)viewWillAppear:(BOOL)animated{
    [self.tabBarController.tabBar setHidden:NO];
    [[UITabBar appearance] setTintColor:[UIColor whiteColor]];
    [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
    [tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"%lu", [[Produto allObjects]count]);
    return [[Produto allObjects]count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ListaTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"produto" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    //adicionando produto para passar pela segue
    
    cell.nome.text = [[[_singleton retornoProd]objectAtIndex:indexPath.row]nome];
 
    
    cell.data.text = [[[_singleton retornoProd]objectAtIndex:indexPath.row]
                      dataValidade];
    
    if ([[[[_singleton retornoProd]objectAtIndex:indexPath.row]diasFaltando] isEqualToString:@"1"]) {
        cell.diasFaltando.text = [NSString stringWithFormat:@"%@ dia", [[[_singleton retornoProd]objectAtIndex:indexPath.row]diasFaltando]];

    } else {
        cell.diasFaltando.text = [NSString stringWithFormat:@"%@ dias", [[[_singleton retornoProd]objectAtIndex:indexPath.row]diasFaltando]];
    }
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //ao selecionar set nas properties do produto
    [_produto setNome: [[[_singleton retornoProd]objectAtIndex:indexPath.row]nome]];
    
    [_produto setNumCodigoDeBarras:[[[_singleton retornoProd]objectAtIndex:indexPath.row]numCodigoDeBarras]];
    
    [_produto setDataValidade:[[[_singleton retornoProd]objectAtIndex:indexPath.row]dataValidade]];
    
    [_produto setDiasFaltando:[[[_singleton retornoProd]objectAtIndex:indexPath.row]diasFaltando]];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source

        Produto *auxProduto = [[_singleton retornoProd]objectAtIndex:indexPath.row];
        NSLog(@"nomeProduto: %@", auxProduto.nome);
        
        [_singleton removeProduto: auxProduto];
        
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [[UIApplication sharedApplication] setApplicationIconBadgeNumber:0];
        [[UIApplication sharedApplication] cancelAllLocalNotifications];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([sender isKindOfClass: [ListaTableViewCell class]])
    {
        //a property produto da proxima view controller recebe objeto produto
        //lembrar de tratar memory leak! obs: ambos objetos tem que ser Strong
        DetalhesViewController *detalhesVC = [segue destinationViewController];
        [detalhesVC setProduto:_produto];
    }
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    [tableView setEditing:editing animated:YES];
    if (editing) {
        _addProdutos.enabled = NO;
    } else {
        _addProdutos.enabled = YES;
    }
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

@end
