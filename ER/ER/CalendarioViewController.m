//
//  CalendarioViewController.m
//  ER
//
//  Created by Leonardo Rodrigues de Morais Brunassi on 25/03/15.
//  Copyright (c) 2015 Vivian Chiodo Dias. All rights reserved.
//

#import "CalendarioViewController.h"

@interface CalendarioViewController ()

@end

@implementation CalendarioViewController
@synthesize aux;
static int i = 0;
//diaAlerta
//alerta on/off
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Calendário";
    self.navigationItem.title = @"Calendário";
    _singleton = [ProdutoSingleton instance];
     self.tableView.allowsSelection = NO;
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
    _day0 = 0;
    _day1 = 0;
    _day2 = 0;
    _day3 = 0;
    _day4 = 0;
    _day5 = 0;
    _day6 = 0;
    _array0 = [[NSMutableArray alloc]init];
    _array1 = [[NSMutableArray alloc]init];
    _array2 = [[NSMutableArray alloc]init];
    _array3 = [[NSMutableArray alloc]init];
    _array4 = [[NSMutableArray alloc]init];
    _array5 = [[NSMutableArray alloc]init];
    _array6 = [[NSMutableArray alloc]init];
    [self produtoPorDia];
    
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 7;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
//        if(section == 0)
//            return _day0;
//        if(section == 1)
//            return _day1;
//        if(section == 2)
//            return _day2;
//        if(section == 3)
//            return _day3;
//        if(section == 4)
//            return _day4;
//        if(section == 5)
//            return _day5;
//        if(section == 6)
//            return _day6;
//        else
//            return 0;
    
    if(section == 0)
        return [_array0 count];
    if(section == 1)
        return [_array1 count];
    if(section == 2)
        return [_array2 count];
    if(section == 3)
        return [_array3 count];
    if(section == 4)
        return [_array4 count];
    if(section == 5)
        return [_array5 count];
    if(section == 6)
        return [_array6 count];
    else
        return 0;
}

-(NSString *) tableView:(UITableView *) tableView titleForHeaderInSection:(NSInteger)section {
    NSDate *now = [NSDate date];
    NSDateComponents* components = [[NSDateComponents alloc] init];
    components.day=1;
    NSDate *newDate;
    NSDateFormatter *weekday = [[NSDateFormatter alloc] init];
    [weekday setDateFormat: @"EEEE, dd/MM/yyyy"];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSLog(@"The day of the week is: %@", [weekday stringFromDate:now]);
    switch (section) {
        case 0:
            return [[weekday stringFromDate:now] uppercaseString];
            break;
        case 1:
            newDate = [calendar dateByAddingComponents:components toDate:now options:0];
            components.day=2;
            return [[weekday stringFromDate:newDate ] uppercaseString];
            break;
        case 2:
            components.day=2;
            newDate = [calendar dateByAddingComponents:components toDate:now options:0];
            return [[weekday stringFromDate:newDate ] uppercaseString];
            break;
        case 3:
            components.day=3;
            newDate = [calendar dateByAddingComponents:components toDate:now options:0];
            return [[weekday stringFromDate:newDate ] uppercaseString];
            break;
        case 4:
            components.day=4;
            newDate = [calendar dateByAddingComponents:components toDate:now options:0];
            return [[weekday stringFromDate:newDate ] uppercaseString];
            break;
        case 5:
            components.day=5;
            newDate = [calendar dateByAddingComponents:components toDate:now options:0];
            return [[weekday stringFromDate:newDate ] uppercaseString];
            break;
        case 6:
            components.day=6;
            newDate = [calendar dateByAddingComponents:components toDate:now options:0];
            return [[weekday stringFromDate:newDate ] uppercaseString];
            break;
        default:
            return nil;
            break;
            
            
    }
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CalendarioTableViewCell *cal = [self.tableView dequeueReusableCellWithIdentifier:@"produtoCalendario" forIndexPath:indexPath];
    cal.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cal.produtoCalend.text = nil;
    
//    if([[[[_singleton retornoProd] objectAtIndex:indexPath.row]diasFaltando] isEqualToString:[NSString stringWithFormat:@"%ld",(long)indexPath.section]])
//        {
//            cal.produtoCalend.text = [[[_singleton retornoProd] objectAtIndex:indexPath.row]nome];
//        }

    //    cal.produtoCalend.text = [[[_singleton retornoProd] objectAtIndex:indexPath.row]nome];
    
    /* esse aqui está funcionando mais ou menos
    for(int i = 0; i < [[_singleton retornoProd]count]; i++)
    {
        NSLog(@"valor indexPath: %ld", indexPath.section);
        if([[NSString stringWithFormat:@"%ld",indexPath.section]isEqualToString: [[[_singleton retornoProd]objectAtIndex:i]diasFaltando]])
        {
            cal.produtoCalend.text = [[[_singleton retornoProd] objectAtIndex:i]nome];
            
        }
    }
    */
    
    i = 0;
    if([_array0 count]!= 0)
    if([[NSString stringWithFormat:@"%ld",indexPath.section]isEqualToString: [[_array0 objectAtIndex:i]diasFaltando]])
        {
            cal.produtoCalend.text = [[_array0 objectAtIndex: indexPath.row]nome];
            [_array0 removeObject:0];
            i++;
            
            if(i >= _array0.count)
                i = 0;
        }
    
    i = 0;
    if([_array1 count]!= 0)
    if([[NSString stringWithFormat:@"%ld",indexPath.section]isEqualToString: [[_array1 objectAtIndex:i]diasFaltando]])
    {
        cal.produtoCalend.text = [[_array1 objectAtIndex: indexPath.row]nome];
        [_array1 removeObject:0];
        i++;
        
        if(i >= _array1.count)
            i = 0;
    }
    
    i = 0;
    if([_array2 count]!= 0)
    if([[NSString stringWithFormat:@"%ld",indexPath.section]isEqualToString: [[_array2 objectAtIndex:i]diasFaltando]])
    {
        cal.produtoCalend.text = [[_array2 objectAtIndex: indexPath.row]nome];
        [_array2 removeObject:0];
        i++;
        
    }
    
    i = 0;
    if([_array3 count]!= 0)
        if([[NSString stringWithFormat:@"%ld",indexPath.section]isEqualToString: [[_array3 objectAtIndex:i]diasFaltando]])
        {
            cal.produtoCalend.text = [[_array3 objectAtIndex: indexPath.row]nome];
            [_array3 removeObject:0];
            i++;
        }
    
    i = 0;
    if([_array4 count] != 0)
        if([[NSString stringWithFormat:@"%ld",indexPath.section]isEqualToString: [[_array4 objectAtIndex:i]diasFaltando]])
        {
        cal.produtoCalend.text = [[_array4 objectAtIndex: indexPath.row]nome];
        [_array4 removeObject:0];
        i++;
        }
    
    i = 0;
    if([_array5 count] != 0)
        if([[NSString stringWithFormat:@"%ld",indexPath.section]isEqualToString: [[_array5 objectAtIndex:i]diasFaltando]])
        {
            cal.produtoCalend.text = [[_array5 objectAtIndex: indexPath.row]nome];
            [_array5 removeObject:0];
            i++;
        
            
    }
    
    i = 0;
    if([_array6 count] != 0)
        if([[NSString stringWithFormat:@"%ld",indexPath.section]isEqualToString: [[_array6 objectAtIndex:i]diasFaltando]])
    {
        cal.produtoCalend.text = [[_array6 objectAtIndex: indexPath.row]nome];
        [_array6 removeObject:0];
        i++;
    }
    
    i = 0;
    
    return cal;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)produtoPorDia
{
    for(int i = 0; i < [[_singleton retornoProd]count]; i++)
    {
//       if([[[[_singleton retornoProd]objectAtIndex:i]diasFaltando]isEqualToString:[NSString stringWithFormat:@"%d",0]])
//           _day0++;
//       if([[[[_singleton retornoProd]objectAtIndex:i]diasFaltando]isEqualToString:[NSString stringWithFormat:@"%d",1]])
//            _day1++;
//        if([[[[_singleton retornoProd]objectAtIndex:i]diasFaltando]isEqualToString:[NSString stringWithFormat:@"%d",2]])
//            _day2++;
//        if([[[[_singleton retornoProd]objectAtIndex:i]diasFaltando]isEqualToString:[NSString stringWithFormat:@"%d",3]])
//            _day3++;
//        if([[[[_singleton retornoProd]objectAtIndex:i]diasFaltando]isEqualToString:[NSString stringWithFormat:@"%d",4]])
//            _day4++;
//        if([[[[_singleton retornoProd]objectAtIndex:i]diasFaltando]isEqualToString:[NSString stringWithFormat:@"%d",5]])
//            _day5++;
//        if([[[[_singleton retornoProd]objectAtIndex:i]diasFaltando]isEqualToString:[NSString stringWithFormat:@"%d",6]])
//            _day6++;
//    }
        
        if([[[[_singleton retornoProd]objectAtIndex:i]diasFaltando]isEqualToString:[NSString stringWithFormat:@"%d",0]])
            [_array0 addObject:[[_singleton retornoProd]objectAtIndex:i]];
        if([[[[_singleton retornoProd]objectAtIndex:i]diasFaltando]isEqualToString:[NSString stringWithFormat:@"%d",1]])
            [_array1 addObject:[[_singleton retornoProd]objectAtIndex:i]];
        if([[[[_singleton retornoProd]objectAtIndex:i]diasFaltando]isEqualToString:[NSString stringWithFormat:@"%d",2]])
            [_array2 addObject:[[_singleton retornoProd]objectAtIndex:i]];
        if([[[[_singleton retornoProd]objectAtIndex:i]diasFaltando]isEqualToString:[NSString stringWithFormat:@"%d",3]])
            [_array3 addObject:[[_singleton retornoProd]objectAtIndex:i]];
        if([[[[_singleton retornoProd]objectAtIndex:i]diasFaltando]isEqualToString:[NSString stringWithFormat:@"%d",4]])
            [_array4 addObject:[[_singleton retornoProd]objectAtIndex:i]];
        if([[[[_singleton retornoProd]objectAtIndex:i]diasFaltando]isEqualToString:[NSString stringWithFormat:@"%d",5]])
            [_array5 addObject:[[_singleton retornoProd]objectAtIndex:i]];
        if([[[[_singleton retornoProd]objectAtIndex:i]diasFaltando]isEqualToString:[NSString stringWithFormat:@"%d",6]])
            [_array6 addObject:[[_singleton retornoProd]objectAtIndex:i]];
    }

    
}

@end
