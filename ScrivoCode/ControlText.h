//
//  ControlText.h
//  ScrivoCode
//
//  Created by Mattia Leggieri on 30/12/20.
//

#import <Cocoa/Cocoa.h>
#import <objc/runtime.h>
#import "ScrivoCode.h"

@interface ControlText : NSObject
@property (nonatomic, readwrite) ScrivoCode *sc;
/// Conta i bit del testo inserito e lo confronta una lettera alla volta con le stringhe della libreria 
- (void)control:(NSString *)c;
/// Ritorna la frase o il simbolo se presente nel dictionary salvato in ScriviCode
- (NSString *)trovaSimbolo:(NSString *)ts;
@end

