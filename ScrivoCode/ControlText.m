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
/// Far contare i bit di okPass, se i bit di stringaSave sono minori o uguali far confrontare la frase con pass e se è contenuta in pass salvala
- (void)okPass:(NSString *)op stringaSave:(NSString *)ss
{
    // Far contare i bit di okPass, se i bit di stringaSave sono minori o uguali far confrontare la frase con pass e se è contenuta in pass salvala
    
 // buffer stringa save1 = sempre un bit alla volta
    NSData *bufferSS = [ss dataUsingEncoding:NSUTF8StringEncoding];
    NSInteger i = [bufferSS length];
    
 // buffer stringa pass
    NSData *bufferOP = [op dataUsingEncoding:NSUTF8StringEncoding];
    NSInteger a = [bufferOP length];

    NSLog(@"%li", i);
    NSLog(@"%li", a);
 // Passa i valori del pass
    for (NSString *ok in [_sc.arrSimb objectForKey:@"SINTAX_IF"])
    {
    // Scrivere: se la lettera è presente nel pass non fargli confrontare altre stringhe del pass fino all'entrata della lettera successiva di stringaSave e se la stringa salvata è uguale a quella del pass salvarla in un array
        NSLog(@"pass ok = %@", ok);
    }
    NSLog(@"Da Scrivere il metodo!!!");
}

- (NSString *)trovaSimbolo:(NSString *)ts
{
    for (NSString *pass in [_sc.arrSimb objectForKey:@"SINTAX_IF"])
    {
        NSLog(@"pass = %@", pass);
        
        NSData *buffer = [pass dataUsingEncoding:NSUTF8StringEncoding];  // testo inserito
     // Lunghezza buffer
        NSUInteger i = [buffer length];
        int a = 0;
    
    // Scorre le lettere del pass - !!! Fargli scartare le lettere se la frase non è uguale a quella del pass
        while (a < i)
        {
          NSLog(@"ts = %@", ts);
          NSLog(@"substringToIndex = %@", [pass substringWithRange:NSMakeRange(a, 1)]);
          NSLog(@"pass = %@", pass);
       // Se la lettera in entrata è uguale alla lettera del pass salva la lettera  **** ERROR! ****
          if ([ts isEqualToString:[pass substringWithRange:NSMakeRange(a++, 1)]])
          {
          // Manca da far confrontare save1 con la frase del pass
             save1 = [ok1 stringByAppendingString:ts];    // Salva una lettera alla volta
          
             [self okPass:pass stringaSave:save1];
             NSLog(@"*******     save ok!! = %@", save1);
          }
        }
        NSLog(@"SALVATO = %@", save1);
    }
    return save1;
}

- (void)control:(NSString *)c
{
 /* Trasformare in bit la stringa per farla controllare
  
    NSString *f = @"if";
    NSData *frase = [f dataUsingEncoding:NSUTF8StringEncoding];
   long tc1Size = 2;
   NSData *dataByte = [NSData dataWithBytes:(__bridge const void *)(f) length:[buffer length]];
  
*/
    
 // scomporre il buffer per confrontarlo con frase               - na parola!!!
    NSData *buffer = [c dataUsingEncoding:NSUTF8StringEncoding];  // testo inserito
    
 // Lunghezza buffer
    NSUInteger i = [buffer length];
    
 // Legge i bit uno alla volta e li salva in una stringa
    NSString *save, *ok = @"";
    int a = 0;
    NSLog(@"i = %lu", i);
    
 // Finche a è minore del buffer
    while (a < i)
    {
        save = [ok stringByAppendingString:[c substringToIndex:a]];
        
     // Controllo sul testo scomposto in lettere e salvato se trovato in library
        result = [result stringByAppendingString:[self trovaSimbolo:[c substringWithRange:NSMakeRange(a++, 1)]]];
        
     // Secondo controllo per verificare la frase
        for (NSString *go in [_sc.arrSimb objectForKey:@"SINTAX_IF"])
        {
            NSLog(@"result = %@", result);
            NSLog(@"sin = %@", go);
            if ([result isEqualToString:go])
            {
                resultOK = result;
            }
        }
        
        NSLog(@"%@", [c substringToIndex:a]);
        NSLog(@"save = %@", save);
        //NSLog(@"withRange = %@", [c substringWithRange:NSMakeRange(a++, 1)]);
    }
    
    NSLog(@"scarto = %@", scarta);
    NSLog(@"RESULT = %@", resultOK);
    NSLog(@"bufferText = %@", buffer);
}

@end
