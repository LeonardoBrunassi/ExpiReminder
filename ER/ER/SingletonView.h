//
//  SingletonView.h
//  ER
//
//  Created by Leonardo Rodrigues de Morais Brunassi on 25/03/15.
//  Copyright (c) 2015 Vivian Chiodo Dias. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingletonView : NSObject

+(SingletonView*) instance;
@property NSMutableArray* produtos;

@end
