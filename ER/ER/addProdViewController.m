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

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"Oi");
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    [cell.textLabel setText:@"Leo"];
    return cell;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
