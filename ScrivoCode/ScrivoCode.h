#import <Cocoa/Cocoa.h>
#import <stdio.h>
#import <stdlib.h>
#import <string.h>

@interface ScrivoCode : NSObject
@property (nonatomic, readwrite) NSDictionary *arrSimb;
/// Ritorna una stringa con il testo inserito
- (NSString *)scriviCodice;
/// Scrive sul file selezionato
- (BOOL)textFile:(NSString *)tf dirFile:(NSString *)df;
@end
