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
    
    notificacao = [[UILocalNotification alloc]init];
    
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
        NSDate *currentDate = [NSDate date];
        [_datePicker.datePicker setMinimumDate:currentDate];
        return _datePicker;
    }
    
    if (indexPath.row == 2) {
        UITableViewCell *celula = [[UITableViewCell alloc] init];
        celula.backgroundColor = [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:0.5];
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
        _imagem.imgProd.image = [UIImage imageNamed:@"default.png"];
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
    
    
    //UIALERTCONTROLLER
    if ([produtoCell.registroProdTF.text  isEqual: @""]) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Erro" message:@"Nome do produto obrigatório." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {}];
        
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }
    else {
    [produto setNome: produtoCell.registroProdTF.text];
    
    
    //NSDate *data = _datePicker.datePicker.date;

    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"dd/MM/yyyy"];
    NSString *dateString = [format stringFromDate:_datePicker.datePicker.date];
    
    
    //[produto setDataValidade:dateString];
    
    [produto setDataValidade:(NSDate *)dateString];
    [singleton adicionarProd:produto];
    
        if(produto)
        produto = [[Produto alloc]init];
       
    NSString *nome = (@"% vai expirar em breve.", produtoCell.registroProdTF.text);
    notificacao.alertBody = nome;

    //notificacao.fireDate = [data dateByAddingTimeInterval:-(60*60*24)];
    notificacao.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
    notificacao.timeZone = [NSTimeZone defaultTimeZone];
    
    notificacao.soundName = UILocalNotificationDefaultSoundName;
    notificacao.applicationIconBadgeNumber = 0;
    
    
    [[UIApplication sharedApplication] scheduleLocalNotification:notificacao];
    [self.navigationController popToRootViewControllerAnimated:YES];
    }

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)tirarFoto:(id)sender {
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    } else {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    imagePicker.delegate = self;
    imagePicker.allowsEditing = YES;
    [self presentViewController:imagePicker animated:YES completion:nil];
}

-(void) imagePickerController:(UIImagePickerController *) picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    
    _imagem.imgProd.contentMode = UIViewContentModeScaleAspectFit;
    [_imagem.imgProd setImage: image];
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
