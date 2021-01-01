//
//  ControlText.m
//  ScrivoCode
//
//  Created by Mattia Leggieri on 30/12/20.
//

#import "ControlText.h"

@implementation ControlText
{
    NSString *save1, *ok1, *result, *resultOK, *scarta;
    int piu;
}

- (id)init
{
    if ((self = [super init]))
    {
        NSLog(@"Initializing class %@", [self class]);
        _sc = [[ScrivoCode alloc] init];
        save1 = @"";
        ok1 = @"";
        result = @"";
    }
    return self;
}

- (NSString *)trovaSimbolo:(NSString *)ts
{
    for (NSString *pass in [_sc.arrSimb objectForKey:@"SINTAX_IF"])
    {
        NSData *buffer = [pass dataUsingEncoding:NSUTF8StringEncoding];
     // Lunghezza buffer pass
        NSUInteger i = [buffer length];
        int a = 0;
    // Scorre le lettere del pass - !!! Fargli scartare le lettere se la frase non è uguale a quella del pass
        while (a < i)
        {
          NSLog(@"lettera in = %@", ts);
          NSLog(@"pass lettera = %@", [pass substringWithRange:NSMakeRange(a, 1)]);
          NSLog(@"pass = %@", pass);
            
       /// Fargli controllare qua save1 o salvare la stringa
            
       // Se la lettera in entrata è uguale alla lettera del pass salva la lettera  **** ERROR! ****
          if ([ts isEqualToString:[pass substringWithRange:NSMakeRange(a++, 1)]])
          {
          // salva la lettera se è presente nel pass ma non dovrebbe usare altri pass
             save1 = [ok1 stringByAppendingString:ts];    // Salva una lettera alla volta
             NSLog(@"*******     save ok!! = %@", save1);
             break;
          }
        }
        NSLog(@"SALVATO = %@", save1);
    }
    return save1;
}

- (void)control:(NSString *)c
{
 // scomporre il buffer per confrontarlo con frase               - na parola!!!
    NSData *buffer = [c dataUsingEncoding:NSUTF8StringEncoding];  // testo inserito
    
 // Lunghezza buffer
    NSUInteger i = [buffer length];
    
 // Legge i bit uno alla volta e li salva in una stringa
    int a = 0;
    NSLog(@"i = %lu", i);
    
 // Finche a è minore del buffer = testo inserito
    while (a < i)
    {
        
     // Controllo sul testo scomposto in lettere e salvato se trovato in library
        result = [result stringByAppendingString:[self trovaSimbolo:[c substringWithRange:NSMakeRange(a++, 1)]]];
        NSLog(@"RESULT = %@", result);
    }
    //NSLog(@"RESULT = %@", result);
    NSLog(@"bufferText = %@", buffer);
}

@end
