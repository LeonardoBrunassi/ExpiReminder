//
//  ProdutoSingleton.h
//  ER
//
//  Created by Leonardo Rodrigues de Morais Brunassi on 25/03/15.
//  Copyright (c) 2015 Vivian Chiodo Dias. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@interface ProdutoSingleton : NSObject

+(ProdutoSingleton*) instance;

-(void)atualizarProduto:(NSString *)nomeProduto barCode:(NSString *)barCode dataValidade:(NSDate *)dataValidade dataInsercao:(NSDate *)dataInsercao;


@property RLMRealm *realm;
@property RLMResults *results; //SELECT
@property Produto *prod;

@end