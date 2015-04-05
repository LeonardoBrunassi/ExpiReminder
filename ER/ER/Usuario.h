//
//  Usuario.h
//  ER
//
//  Created by Rafael  Hieda on 05/04/15.
//  Copyright (c) 2015 Vivian Chiodo Dias. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@interface Usuario : RLMObject

@property int days;
@property long daysConverted;
@property int key;

-(NSString *)primaryKey;
@end
