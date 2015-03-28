//
//  addProdViewController.h
//  ER
//
//  Created by Leonardo Rodrigues de Morais Brunassi on 26/03/15.
//  Copyright (c) 2015 Vivian Chiodo Dias. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataValidadeTableViewCell.h"

@interface addProdViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITableView *cadastroTableView;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *barCodeCam;
@property (weak, nonatomic) IBOutlet UIToolbar *editToolBar;

@end
