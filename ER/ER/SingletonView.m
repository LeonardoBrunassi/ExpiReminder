//
//  SingletonView.m
//  ER
//
//  Created by Leonardo Rodrigues de Morais Brunassi on 25/03/15.
//  Copyright (c) 2015 Vivian Chiodo Dias. All rights reserved.
//

#import "SingletonView.h"

@implementation SingletonView
@synthesize realm,results;
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
        realm = [RLMRealm defaultRealm];
    }
    return self;
}

-(void) adicionarProd: (Produto*) produto {
    realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm addObject:produto];
    [realm commitWriteTransaction];
}

//retornar todos produtos
-(RLMResults*) retornoProd {
    RLMResults *resultado = [Produto allObjects];
    return resultado;
}

-(void)removeProduto:(Produto *)produto
{
    [realm beginWriteTransaction];
    
    [realm delete:produto];
    
    [realm commitWriteTransaction];
}

-(void)atualizarProduto:(NSString *)nomeProduto barCode:(NSString *)barCode dataValidade:(NSDate *)dataValidade dataInsercao:(NSDate *)dataInsercao
{
    [realm beginWriteTransaction];
    _prod.nome = nomeProduto;
    _prod.numCodigoDeBarras = barCode;
    _prod.dataCompraInsercao = dataInsercao;
    _prod.validadeRestante = dataValidade;
    [realm commitWriteTransaction];
    
}



@end
