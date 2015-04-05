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

-(id)init
{
    self = [super init];
    if(self)
        realm = [RLMRealm defaultRealm];
    return self;
}

+(id)sharedInstance
{
    if(!singleton)
         singleton = [[UsuarioSingleton alloc]init];
    return singleton;
}

-(void)createUsuario
{
    Usuario *newUser = [[Usuario alloc]init];
    [newUser setDays:1];
    [newUser setDaysConverted:0];
    //[newUser setKey:0];
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
    //[realm addOrUpdateObject:updateUsuario];
    [Usuario createOrUpdateInDefaultRealmWithObject:updateUsuario];
    [realm commitWriteTransaction];
}

@end
