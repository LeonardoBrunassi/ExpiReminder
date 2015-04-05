//
//  FotoSingleton.h
//  ER
//
//  Created by Vivian Chiodo Dias on 05/04/15.
//  Copyright (c) 2015 Vivian Chiodo Dias. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FotoSingleton : NSObject
+ (FotoSingleton*)instance;

- (void)salvarFoto:(UIImage *)foto comNome:(NSString *)nome;
- (UIImage *)recuperarFotoComNome:(NSString *)nome;
@end
