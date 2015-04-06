//
//  FotoSingleton.m
//  ER
//
//  Created by Vivian Chiodo Dias on 05/04/15.
//  Copyright (c) 2015 Vivian Chiodo Dias. All rights reserved.
//

#import "FotoSingleton.h"

@implementation FotoSingleton
static FotoSingleton *instancia = nil;

-(void)salvarFoto:(UIImage *)foto comNome:(NSString *)nome {
    UIImage *imagem =
    [UIImage imageWithCGImage:[foto CGImage]
                        scale:1.0
                  orientation: UIImageOrientationUp];
    NSString *fileName = [NSString stringWithFormat:@"%@.png", nome];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:fileName];
    
    [UIImagePNGRepresentation(imagem) writeToFile:filePath atomically:YES];
}

-(UIImage *)recuperarFotoComNome:(NSString *)nome {
    NSString *fileName = [NSString stringWithFormat:@"%@.png", nome];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:fileName];
    
    return [UIImage imageWithContentsOfFile:filePath];
}

+(FotoSingleton *)instance{
    if(!instancia) {
        instancia = [[super alloc] init];
    }
    return instancia;
}

-(instancetype) init {
    self = [super init];
    return self;
}

@end
