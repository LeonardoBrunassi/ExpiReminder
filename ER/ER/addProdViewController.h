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
#import "Usuario.h"
#import "UsuarioSingleton.h"


@class Produto;

@interface addProdViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate, UIAlertViewDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *cadastroTableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *barCodeCam;
@property (weak, nonatomic) IBOutlet UIToolbar *editToolBar;
@property (strong, nonatomic) Produto *produto;
@property UILocalNotification *notificacao;
@property (strong,nonatomic) NSString *aux;

- (IBAction)tirarFoto:(id)sender;
@property (nonatomic, weak) ProdutoTableViewCell *produtoCell;
@property(nonatomic, weak) DataValidadeTableViewCell *dataValidade;
@property(nonatomic,weak )ImagemTableViewCell *imagem;
@property (nonatomic, weak) DatePickerTableViewCell *datePicker;
@property Usuario *user;
@property UsuarioSingleton *usuarioSingleton;

@end
