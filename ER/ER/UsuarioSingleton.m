//
//  UsuarioSingleton.m
//  ER
//
//  Created by Rafael  Hieda on 05/04/15.
//  Copyright (c) 2015 Vivian Chiodo Dias. All rights reserved.
//

#import "UsuarioSingleton.h"

@implementation UsuarioSingleton
@synthesize  realm, results;
static UsuarioSingleton *singleton;

-(id)sharedInstance
{
    if([singleton isEqual:nil])
         singleton = [[UsuarioSingleton alloc]init];
    return singleton;
}

-(void)createUsuario
{
    Usuario *newUser = [[Usuario alloc]init];
    [newUser setDays:1];
    [newUser setDaysConverted:0];
    [realm beginWriteTransaction];
    [realm addObject:newUser];
    [realm commitWriteTransaction];
}

-(RLMResults *)loadUsuario
{
    results = [Usuario allObjects];
    return results;
}

-(void)updateUsuario:(Usuario *)updateUsuario
{
    [realm beginWriteTransaction];
    [realm addOrUpdateObject:updateUsuario];
    [realm commitWriteTransaction];
}

@end
