//
//  ProdutoSingleton.m
//  ER
//
//  Created by Leonardo Rodrigues de Morais Brunassi on 25/03/15.
//  Copyright (c) 2015 Vivian Chiodo Dias. All rights reserved.
//

#import "ProdutoSingleton.h"
#import "Produto.h"
@implementation ProdutoSingleton
@synthesize realm,results;
static ProdutoSingleton *instancia = nil;

+(ProdutoSingleton *) instance {
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

-(void) adicionarProd: (Produto *) produto {
    
    
    [realm beginWriteTransaction];
    [realm addObject:produto];
    [realm commitWriteTransaction];
    
//    realm = [RLMRealm defaultRealm];
//    RLMResults *resultado = [Produto allObjects];
//    resultado = [resultado sortedResultsUsingProperty:@"dataValidade" ascending:YES];
}

//retornar todos produtos
-(RLMResults*) retornoProd {
    RLMResults *resultado = [Produto allObjects];
     resultado = [resultado sortedResultsUsingProperty:@"dataValidade" ascending:YES];
    return resultado;
   

}

-(void)removeProduto:(Produto *)produto
{
    [realm beginWriteTransaction];
    
    [realm deleteObject:produto];
    
    [realm commitWriteTransaction];
}

-(void)atualizarProduto:(NSString *)nomeProduto barCode:(NSString *)barCode dataValidade:(NSString *)dataValidade dataInsercao:(NSDate *)dataInsercao
{
//    [realm beginWriteTransaction];
//    _prod.nome = nomeProduto;
//    _prod.numCodigoDeBarras = barCode;
////    _prod.dataCompraInsercao = dataInsercao;
//    _prod.dataValidade = dataValidade;
//    [realm commitWriteTransaction];
    
}



@end
