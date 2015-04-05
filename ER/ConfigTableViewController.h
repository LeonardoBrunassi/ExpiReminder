//
//  ConfigTableViewController.h
//  ER
//
//  Created by André Helaehil on 31/03/15.
//  Copyright (c) 2015 Vivian Chiodo Dias. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlertaTableViewCell.h"
#import "DataAlertaTableViewCell.h"

@interface ConfigTableViewController : UITableViewController

@property AlertaTableViewCell *alerta;
@property DataAlertaTableViewCell *dataAlerta;
@property UsuarioSingleton *singleton;
@end
