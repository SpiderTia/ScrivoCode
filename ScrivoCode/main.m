//
//  main.m
//  ScrivoCode
//
//  Created by Mattia Leggieri on 30/12/20.
//

#import "ScrivoCode.h"

int main(int argc, const char *argv[])
{
    @autoreleasepool
    {
        ScrivoCode *sc = [[ScrivoCode alloc] init];
        NSString *text = [sc scriviCodice];
        NSString *file = @"/Users/tia/Desktop/ScrivoCode/ScrivoCode/header.h";
        NSFileManager *manager = [[NSFileManager alloc] init];
        
        NSLog(@"%@", [sc.arrSimb objectForKey:@"INTERFACE"]);
        [sc textFile:text dirFile:file];
        
        if ([manager fileExistsAtPath:file])
            NSLog(@"File trovato");
        
        NSLog(@"text = %@", text);
    }
    return 0;
}
