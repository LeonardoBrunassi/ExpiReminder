//
//  Usuario.m
//  ER
//
//  Created by Rafael  Hieda on 05/04/15.
//  Copyright (c) 2015 Vivian Chiodo Dias. All rights reserved.
//

#import "Usuario.h"

@implementation Usuario


-(id)init
{
    self = [super init];
    return self;
}


-(long)daysInSeconds
{
    return [self days] * (3600 * 24);
}

-(NSString *)primaryKey
{
    return @"key";
}
@end
