//
//  AlertaTableViewCell.m
//  ER
//
//  Created by André Helaehil on 31/03/15.
//  Copyright (c) 2015 Vivian Chiodo Dias. All rights reserved.
//

#import "AlertaTableViewCell.h"


@implementation AlertaTableViewCell

- (IBAction)alterarConfiguracoes:(id)sender {
    //atribuir um objeto diretamente a sua instancia, significa que estou passando o endereço da instancia também. esse método abaixo, faz que isso Não ocorra, ou seja, só recebe o conteúdo das
    //properties dela.
    Usuario *user = [[Usuario alloc]initWithObject: [[[UsuarioSingleton sharedInstance]loadUsuario]objectAtIndex:0]];
    if([sender isOn])
    {
        [user setFireNotification:YES];
        UsuarioSingleton *userSingleton = [UsuarioSingleton sharedInstance];
        [userSingleton updateUsuario:user];
    }
    else
    {
        [user setFireNotification: NO];
        UsuarioSingleton *userSingleton = [UsuarioSingleton sharedInstance];
        [userSingleton updateUsuario:user];
    }
    
}



@end
