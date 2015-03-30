//
//  addProdViewController.m
//  ER
//
//  Created by Leonardo Rodrigues de Morais Brunassi on 26/03/15.
//  Copyright (c) 2015 Vivian Chiodo Dias. All rights reserved.
//

#import "addProdViewController.h"
#import "DataValidadeTableViewCell.h"
#import "DatePickerTableViewCell.h"
#import "ImagemTableViewCell.h"
#import "ProdutoTableViewCell.h"

@interface addProdViewController ()

@end

@implementation addProdViewController
@synthesize cadastroTableView, notificacao, produto;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    produto = [[Produto alloc]init];
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
        DataValidadeTableViewCell *dataValidade = [tableView dequeueReusableCellWithIdentifier:@"validade"];
        return dataValidade;
    }
    
    if(indexPath.row == 1){
        DatePickerTableViewCell *datePicker = [tableView dequeueReusableCellWithIdentifier:@"datePicker"];
        return datePicker;
    }
    
    if (indexPath.row == 2) {
        UITableViewCell *celula = [[UITableViewCell alloc] init];
        celula.backgroundColor = [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:0.5];
        celula.contentView.layer.borderColor = [[UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:0.0] CGColor];
        //celula.contentView.layer.borderWidth = 0.0;
        return celula;
    }
    
    if (indexPath.row == 3) {
        ProdutoTableViewCell *produto = [tableView dequeueReusableCellWithIdentifier:@"nome"];
        return produto;
    }
    
    if (indexPath.row == 4) {
        UITableViewCell *celula = [[UITableViewCell alloc] init];
        celula.backgroundColor = [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:0.5];
        return celula;
    }
    
    if (indexPath.row == 5) {
        ImagemTableViewCell *imagem = [tableView dequeueReusableCellWithIdentifier:@"imagem"];
        return imagem;
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
    
    
//    notificacao.alertBody = [NSString stringWithFormat:NSLocalizedString(@"%@ vão .", nil), produto.nome];
//    notificacao.alertAction = NSLocalizedString(@"View Details", nil);
//    notificacao.alertTitle = NSLocalizedString(@"Item Due", nil);
//
//    notificacao.timeZone = [NSTimeZone defaultTimeZone];
//    //xrnotificacao.fireDate =
//    
//    [[UIApplication sharedApplication] scheduleLocalNotification:notificacao];
}
//

//Quando adicionar o produto:

//- (void)scheduleNotificationWithItem:(Produto *)produto interval:(int)minutesBefore {
//    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
//    NSDateComponents *dateComps = [[NSDateComponents alloc] init];
//    NSCalendar *calendario = [[NSCalendar alloc] init];
//    
//    NSDate *itemDate = [calendario dateFromComponents:dateComps];
//    
//    UILocalNotification *localNotif = [[UILocalNotification alloc] init];
//    if (localNotif == nil)
//        return;
//    localNotif.fireDate = [itemDate dateByAddingTimeInterval:-(minutesBefore*1440)];
//    localNotif.timeZone = [NSTimeZone defaultTimeZone];
    
//    localNotif.alertBody = [NSString stringWithFormat:NSLocalizedString(@"%@ in %i minutes.", nil),
//                            produto.nome, minutesBefore];
//    localNotif.alertAction = NSLocalizedString(@"View Details", nil);
//    localNotif.alertTitle = NSLocalizedString(@"Item Due", nil);
    
//    localNotif.soundName = UILocalNotificationDefaultSoundName;
//    localNotif.applicationIconBadgeNumber = 1;
    
//    NSDictionary *infoDict = [NSDictionary dictionaryWithObject:produto.nome forKey:produto];
//    localNotif.userInfo = infoDict;
    
//    [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
