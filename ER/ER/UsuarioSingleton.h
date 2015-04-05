//
//  UsuarioSingleton.h
//  ER
//
//  Created by Rafael  Hieda on 05/04/15.
//  Copyright (c) 2015 Vivian Chiodo Dias. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Usuario.h"

@interface UsuarioSingleton : NSObject
@property RLMRealm *realm;
@property RLMResults *results;
-(id)sharedInstance;
-(void)createUsuario;
-(RLMResults *)loadUsuario;
-(void)updateUsuario:(Usuario *)updateUsuario;
+(id)sharedInstance;
@end
