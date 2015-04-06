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
    
    NSDate *dateNow = [NSDate date];
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    NSDate *dateValidade = [format dateFromString:[[[_singleton retornoProd] objectAtIndex:indexPath.row] dataValidade]];
    cell.diasFaltando.text = [NSString stringWithFormat:@"%f", [dateNow timeIntervalSinceDate:dateValidade]*(60*60*24)];
    NSLog(@"%f", [dateNow timeIntervalSinceDate:dateValidade]*(60*60*24));
    cell.data.text = [[[_singleton retornoProd]objectAtIndex:indexPath.row]
                      dataValidade];
    
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //ao selecionar set nas properties do produto
    [_produto setNome: [[[_singleton retornoProd]objectAtIndex:indexPath.row]nome]];
    
    [_produto setNumCodigoDeBarras:[[[_singleton retornoProd]objectAtIndex:indexPath.row]numCodigoDeBarras]];
    
    [_produto setDataValidade:[[[_singleton retornoProd]objectAtIndex:indexPath.row]dataValidade]];
    
    //falta implementar dias faltando.
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


@end
