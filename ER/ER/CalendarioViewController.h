//
//  CalendarioViewController.h
//  ER
//
//  Created by Leonardo Rodrigues de Morais Brunassi on 25/03/15.
//  Copyright (c) 2015 Vivian Chiodo Dias. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CalendarioTableViewCell.h"
#import "Produto.h"
#import "ProdutoSingleton.h"

@interface CalendarioViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UIView *calendario;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) ProdutoSingleton *singleton;
@property int day0;
@property int day1;
@property int day2;
@property int day3;
@property int day4;
@property int day5;
@property int day6;
@property int aux;

@property NSMutableArray *array0;
@property NSMutableArray *array1;
@property NSMutableArray *array2;
@property NSMutableArray *array3;
@property NSMutableArray *array4;
@property NSMutableArray *array5;
@property NSMutableArray *array6;
@end

