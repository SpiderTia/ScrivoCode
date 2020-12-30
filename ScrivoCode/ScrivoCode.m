#import "ScrivoCode.h"
#define MAX_NAME_SZ 1000

@implementation ScrivoCode

- (id)init 
{	
	if ((self = [super init]))
	{
		NSLog(@"Initializing class %@", [self class]);
	}
    return self;
}

- (NSDictionary *)arrSimb
{
    _arrSimb = @{
        @"PAR_GRAFFE" : @[@"{", @"}"],
        @"PAR_QUADRE" : @[@"[", @"]"],
        @"PAR_TONDE" : @[@"(", @")"],
        @"SINTAX_IF" : @[@"if", @"else if", @"else"],
        @"SINTAX_WHILE" : @[@"while", @"do"],
        @"SINTAX_FOR" : @[@"for"],
        @"ALTRI_SIMB" : @[@"-", @":"],
        @"INTERFACE" : @[@"@interface", @"@end"],
    };
    return _arrSimb;
}

- (NSString *)scriviCodice
{
	NSString *ok = @"";
	char *c = malloc(MAX_NAME_SZ);
	
	fgets(c, MAX_NAME_SZ, stdin);
	NSLog(@"%s", c);
	
	ok = [NSString stringWithUTF8String:c];
	return ok;
}

- (BOOL)textFile:(NSString *)tf dirFile:(NSString *)df
{
    NSFileManager *manager = [[NSFileManager alloc] init];
    NSData *buffer = [tf dataUsingEncoding:NSUTF8StringEncoding];
    if (tf && df)
    {
        if ([manager createFileAtPath:df contents:buffer attributes:nil])
        {
            NSLog(@"File creato in %@", df);
        }
        return YES;
    }
    return NO;
}

@end
