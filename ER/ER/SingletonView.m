//
//  SingletonView.m
//  ER
//
//  Created by Leonardo Rodrigues de Morais Brunassi on 25/03/15.
//  Copyright (c) 2015 Vivian Chiodo Dias. All rights reserved.
//

#import "SingletonView.h"

@implementation SingletonView
@synthesize produtos;
static SingletonView *instancia = nil;

+(SingletonView *) instance {
    if(!instancia) {
        instancia = [[super alloc] init];
    }
    return instancia;
}

-(instancetype) init {
    self = [super init];
    if (self) {
        produtos = [[NSMutableArray alloc] initWithObjects:@"leo", nil];
    }
    return self;
}

@end
