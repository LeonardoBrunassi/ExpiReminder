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
    self.tabBarController.tabBar.hidden = YES;
    
    UIBarButtonItem *done = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(done:)];
    self.navigationItem.rightBarButtonItem = done;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"Vai por favor");
    return 3;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Entro");
    
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    if(indexPath.row == 0){
        _alerta = [tableView dequeueReusableCellWithIdentifier:@"alerta"];
        return _alerta;
    }
    
    if(indexPath.row == 1){
        _dataAlerta = [tableView dequeueReusableCellWithIdentifier:@"dataAlerta"];
        return _dataAlerta;
    }
    
    if (indexPath.row == 2) {
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
        return 200;
    else if (indexPath.row == 1)
        return 200;
    else if (indexPath.row == 2)
        return 400;
 
    else
        return 0;
}

- (void)done:(id)sender{
    
}


@end
