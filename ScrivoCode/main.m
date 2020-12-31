//
//  main.m
//  ScrivoCode
//
//  Created by Mattia Leggieri on 30/12/20.
//

#import "ScrivoCode.h"
#import "ControlText.h"

int main(int argc, const char *argv[])
{
    @autoreleasepool
    {
        
// Dal testo inserito fargli scrivere l'header e in automatico impostargli l'implementazione con i metodi
        
        //ScrivoCode *sc = [[ScrivoCode alloc] init];
        ControlText *ct = [[ControlText alloc] init];
        
        NSString *file = @"/Users/tia/Desktop/ScrivoCode/ScrivoCode/header.h";
        //NSFileManager *manager = [[NSFileManager alloc] init];
        
     // Scrive il testo
        NSString *text = [ct.sc scriviCodice];
    
     // Metodo per controllare testo e inserire simboli
        [ct control:text];
        
        NSLog(@"%@", [ct.sc.arrSimb objectForKey:@"INTERFACE"]);
        
     // Crea nuovo file con il testo inserito
        [ct.sc textFile:text dirFile:file];
        
        NSLog(@"text = %@", text);
    }
    return 0;
}
