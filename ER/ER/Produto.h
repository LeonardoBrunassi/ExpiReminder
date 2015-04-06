//
//  Produto.h
//  ER
//
//  Created by Leonardo Rodrigues de Morais Brunassi on 25/03/15.
//  Copyright (c) 2015 Vivian Chiodo Dias. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Realm/Realm.h>

@interface Produto : RLMObject

@property NSString *nome;
@property NSString *dataValidade;
@property NSString *numCodigoDeBarras;
//@property NSString *diasFaltando;

@end
