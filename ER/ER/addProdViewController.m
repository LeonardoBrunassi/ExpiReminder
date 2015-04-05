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
@synthesize cadastroTableView, produto, produtoCell, notificacao;

#pragma mark metodos delegate

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialize];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
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

-(void)viewWillAppear:(BOOL)animated
{
    [self.tabBarController.tabBar setHidden: YES];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark implementações do grupo



-(void)initialize
{
    self.navigationItem.title = @"Adicionar Produto";
    
    [self.tabBarController setHidesBottomBarWhenPushed:YES];
    self.tabBarController.tabBar.hidden = YES;
    
    UIBarButtonItem *done = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done:)];
    self.navigationItem.rightBarButtonItem = done;

}


//----------------------------------------- METODO QUE SALVA O PRODUTO NO BANCO E CRIA A NOTIFICATION PARA ESSE PRODUTO
-(void)done:(id)sender{
    ProdutoSingleton *singleton = [ProdutoSingleton instance];
    
    produto = [[Produto alloc]init];

// CONDIÇAO DO CODIGO DE BARRAS
    if(_aux == nil)
    {
        _aux = @" ";
        [produto setNumCodigoDeBarras:_aux];
    }
    else{
        [produto setNumCodigoDeBarras:_aux];
    }
    

    
// CONDIÇAO DA CAIXA DE TEXTO
    if ([produtoCell.registroProdTF.text  isEqual: @""]) {
        [self alertViewShowMessageView];
    }
    else
    {
        [produto setNome: produtoCell.registroProdTF.text];
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"dd/MM/yyyy"];
        NSString *dateString = [format stringFromDate:_datePicker.datePicker.date];
        
        [produto setDataValidade:dateString];
        
       // [singleton salvarFoto:_imagem.imgProd.image comNome:[produto nome]];
        [singleton adicionarProd:produto];
        
        [self createLocalNotification];
        
        [self.navigationController popToRootViewControllerAnimated:YES];
    }
    
    
    
}


//-------------------------------------- METODO QUE ENCAPSULA A CRIAÇAO DO ALERTCONTROLLER
-(void)alertViewShowMessageView
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Erro" message:@"Nome do produto obrigatório." preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];

}


//------------------------------------------- METODO QUE ENCAPSULA A CRIAÇAO DA LOCALNOTIFICATION
-(void)createLocalNotification{
    notificacao = [[UILocalNotification alloc]init];
    NSLog(@"%@", _datePicker.datePicker.date);
    notificacao.fireDate = [self setCustomFireDate:_datePicker.datePicker.date];
    NSLog(@"%@", notificacao.fireDate);
    notificacao.timeZone = [NSTimeZone systemTimeZone];
    NSLog(@"%@", notificacao.timeZone);
    //        notificacao.repeatInterval = NSCalendarUnitDay;
    notificacao.alertBody = [NSString stringWithFormat:NSLocalizedString(@"%@ irá vencer em breve.", nil),
                             produto.nome];
    notificacao.alertTitle = NSLocalizedString(@"Produto Vencendo!", nil);
    
    /*
     *Criei um metodo que permite adicionar ou reduzir tempo do fire date em dias, comparando com a data de validade dele.
     */
    notificacao.soundName = UILocalNotificationDefaultSoundName;
    notificacao.applicationIconBadgeNumber= [[UIApplication sharedApplication] applicationIconBadgeNumber] + 1;
    [[UIApplication sharedApplication] scheduleLocalNotification:notificacao];
}

//--------------------------------------------------------------------

//-------------------------------------------- METODOS PARA TIRAR FOTO
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

//---------------------------------------------------------------------


//----------------------------------------------- ARRUMANDO A DATA PARA A NOTIFICATION
-(NSDate *)setCustomFireDate:(NSDate *)changeDate{
    // AGORA FUNCIONA !!!!
    NSDate *newDate =[changeDate dateByAddingTimeInterval:-(3600*3)];

    return newDate;
}


@end
