//
//  ConfigTableViewController.m
//  ER
//
//  Created by André Helaehil on 31/03/15.
//  Copyright (c) 2015 Vivian Chiodo Dias. All rights reserved.
//

#import "ConfigTableViewController.h"

@implementation ConfigTableViewController
- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"Configurações";
    _singleton = [UsuarioSingleton sharedInstance];
    
    
    
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"Vai por favor");
    return 5;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Entro");
    
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    if (indexPath.row == 0) {
        UITableViewCell *celula = [[UITableViewCell alloc] init];
        celula.backgroundColor = [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:0.5];
        return celula;
    }
    
    if(indexPath.row == 1){
        _alerta = [tableView dequeueReusableCellWithIdentifier:@"alerta"];
        //lembrar que temos chamar a target aqui.
        [_alerta.interruptor addTarget:self action:@selector(mudarInterruptor:) forControlEvents:UIControlEventValueChanged];

        return _alerta;
    }
    
    if (indexPath.row == 2) {
        UITableViewCell *celula = [[UITableViewCell alloc] init];
        celula.backgroundColor = [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:0.5];
        return celula;
    }
    
    if(indexPath.row == 3){
        _dataAlerta = [tableView dequeueReusableCellWithIdentifier:@"dataAlerta"];
        
        //Aqui inicia a data que foi escolhida antes de abrir o app
        
        if([[[_singleton loadUsuario]objectAtIndex:0]days] == 1)
            _dataAlerta.dia.text = @"Dia:";
            else
            _dataAlerta.dia.text = @"Dias:";     
        
        [self.dataAlerta.daysSlider setValue: [[[_singleton loadUsuario]objectAtIndex:0]days]];
        self.dataAlerta.daysReminderLabel.text =[NSString stringWithFormat:@"%d",[[[_singleton loadUsuario]objectAtIndex:0]days]];
        
        return _dataAlerta;
    }
    
    if (indexPath.row == 4) {
        UITableViewCell *celula = [[UITableViewCell alloc] init];
        celula.backgroundColor = [UIColor colorWithRed:0.96 green:0.96 blue:0.96 alpha:0.5];
        return celula;
    }
    


    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:UITableViewCellStyleDefault];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0)
        return 35;
    else if (indexPath.row == 1)
        return 50;
    else if (indexPath.row == 2)
        return 35;
    else if (indexPath.row == 3)
    {

            return 50;
    }
    else if (indexPath.row == 4)
        return 35;
 
    else
        return 0;
}

- (void) mudarInterruptor: (id) sender{
    if([_alerta.interruptor isOn]){
        [self.dataAlerta.daysSlider setHidden:NO];
        [self.dataAlerta.dia setHidden:NO];
        [self.dataAlerta.daysReminderLabel setHidden: NO];
    }
    else{
        _alerta.interruptor.on = NO;
        [self.dataAlerta.daysSlider setHidden:YES];
        [self.dataAlerta.dia setHidden:YES];
        [self.dataAlerta.daysReminderLabel setHidden: YES];
        
    }
    
}


@end
