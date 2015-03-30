//
//  addProdViewController.m
//  ER
//
//  Created by Leonardo Rodrigues de Morais Brunassi on 26/03/15.
//  Copyright (c) 2015 Vivian Chiodo Dias. All rights reserved.
//

#import "addProdViewController.h"

@interface addProdViewController ()

@end

@implementation addProdViewController
@synthesize cadastroTableView, notificacao, produto, produtoCell;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //produto = [[Produto alloc]init];
    self.navigationItem.title = @"Adicionar Produto";
    
    [self.tabBarController setHidesBottomBarWhenPushed:YES];
    self.tabBarController.tabBar.hidden = YES;
    
    
    UIBarButtonItem *done = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done:)];
    self.navigationItem.rightBarButtonItem = done;
    
    //self.tabBarController
//    [self.datePicker addTarget:self action:@selector(dataPickerMudada:)forControlEvents:UIControlEventValueChanged];
    // Do any additional setup after loading the view.
}
//
//-(void) dataPickerMudada: (UIDatePicker*) datePicker {
//    NSDateFormatter *dateFormater = [[NSDateFormatter alloc] init];
//    [dateFormater setDateFormat:@"dd-MM-yyyy HH:mm"];
//    NSString *strDate = [dateFormater stringFromDate:datePicker.date];
//    //self.selectedDate.text = strDate;
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"Vai por favor");
    return 6;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Entro");
    
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    if(indexPath.row == 0){
        _dataValidade = [tableView dequeueReusableCellWithIdentifier:@"validade"];
                return _dataValidade;
    }
    
    if(indexPath.row == 1){
        _datePicker = [tableView dequeueReusableCellWithIdentifier:@"datePicker"];
        return _datePicker;
    }
    
    if (indexPath.row == 2) {
        UITableViewCell *celula = [[UITableViewCell alloc] init];
        celula.backgroundColor = [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:0.5];
        celula.contentView.layer.borderColor = [[UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:0.0] CGColor];
        //celula.contentView.layer.borderWidth = 0.0;
        return celula;
    }
    
    if (indexPath.row == 3) {
        produtoCell = [tableView dequeueReusableCellWithIdentifier:@"nome"];
        
        return produtoCell;
    }
    
    if (indexPath.row == 4) {
        UITableViewCell *celula = [[UITableViewCell alloc] init];
        celula.backgroundColor = [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:0.5];
        return celula;
    }
    
    if (indexPath.row == 5) {
        _imagem = [tableView dequeueReusableCellWithIdentifier:@"imagem"];
        return _imagem;
    }
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:UITableViewCellStyleDefault];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0)
        return 50;
    else if (indexPath.row == 1)
        return 200;
    else if (indexPath.row == 2)
        return 35;
    else if (indexPath.row == 3)
        return 50;
    else if (indexPath.row == 4)
        return 35;
    else if (indexPath.row == 5)
        return 190;
    else
        return 0;
}

-(void)viewWillDisappear:(BOOL)animated
{
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.tabBarController.tabBar setHidden: YES];
    NSLog(@"will appear: %@", produto.numCodigoDeBarras);
}

-(void)done:(id)sender{
    
    ProdutoSingleton *singleton = [ProdutoSingleton instance];
        
    produto.nome = produtoCell.registroProdTF.text;
    //[produto setDataValidade:_datePicker.datePicker];
    NSLog(@"nome: %@", produto.nome);
    produto.dataValidade = _datePicker.datePicker.date;
    NSLog(@"DATA: %@", produto.dataValidade);
    
    
    [singleton adicionarProd:produto];
    NSLog(@"%@", [singleton retornoProd]);
    if(produto)
        produto = [[Produto alloc]init];
    
//    if(produto){
//        
//        
//    
//        NSDateComponents *dateComps = [[NSDateComponents alloc] init];
//    
//        notificacao.alertBody = [NSString stringWithFormat:NSLocalizedString(@"%@ vai expirar em breve.", nil), produto.nome];
//        notificacao.alertAction = NSLocalizedString(@"Ver Produto", nil);
//        notificacao.alertTitle = NSLocalizedString(@"Alerta de Validade", nil);
//
//        notificacao.timeZone = [NSTimeZone defaultTimeZone];
//        notificacao.fireDate = [produto.dataValidade dateByAddingTimeInterval:-(60*60*24)];
//    
//        notificacao.soundName = UILocalNotificationDefaultSoundName;
//        notificacao.applicationIconBadgeNumber = 1;
//    
//    
//        [[UIApplication sharedApplication] scheduleLocalNotification:notificacao];
//    }
    
    
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
