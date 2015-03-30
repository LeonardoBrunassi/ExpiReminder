//
//  addProdViewController.h
//  ER
//
//  Created by Leonardo Rodrigues de Morais Brunassi on 26/03/15.
//  Copyright (c) 2015 Vivian Chiodo Dias. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataValidadeTableViewCell.h"
#import "DatePickerTableViewCell.h"
#import "ImagemTableViewCell.h"
#import "ProdutoTableViewCell.h"
#import "Produto.h"
#import "ProdutoSingleton.h"


@class Produto;

@interface addProdViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITableView *cadastroTableView;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *barCodeCam;
@property (weak, nonatomic) IBOutlet UIToolbar *editToolBar;
@property(nonatomic, strong) Produto *produto;
@property (weak, nonatomic) UILocalNotification *notificacao;



@property (nonatomic, weak) ProdutoTableViewCell *produtoCell;
@property(nonatomic, weak) DataValidadeTableViewCell *dataValidade;
@property(nonatomic,weak )ImagemTableViewCell *imagem;
@property (nonatomic, weak) DatePickerTableViewCell *datePicker;
@end
