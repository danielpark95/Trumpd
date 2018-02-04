#import "request.h"

@implementation Request

+ (CGFloat) sentimentForText: (NSString*) text {
    NSString* path = @"https://westus.api.cognitive.microsoft.com/text/analytics/v2.0/sentiment";
    NSArray* array = @[
                       // Request parameters
                       @"entities=true",
                       ];
    
    NSString* string = [array componentsJoinedByString:@"&"];
    path = [path stringByAppendingFormat:@"?%@", string];
    
    //    NSLog(@"%@", path);
    
    NSMutableURLRequest* _request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:path]];
    [_request setHTTPMethod:@"POST"];
    // Request headers
    [_request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [_request setValue:@"7a199fb358bc43da9a5cbbd6f13ee133" forHTTPHeaderField:@"Ocp-Apim-Subscription-Key"];
    // Request body
    NSString* body = [NSString stringWithFormat:@"{ \"documents\": [ { \"language\": \"en\", \"id\": \"string\", \"text\": \"%@\" } ] }", text];
    [_request setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSData* _connectionData = [NSURLConnection sendSynchronousRequest:_request returningResponse:&response error:&error];
    
    CGFloat retVal = 0;
    
    if (nil != error)
    {
        NSLog(@"Error: %@", error);
    }
    else
    {
        NSError* error = nil;
        NSMutableDictionary* json = nil;
        NSString* dataString = [[NSString alloc] initWithData:_connectionData encoding:NSUTF8StringEncoding];
        //        NSLog(@"%@", dataString);
        
        if (nil != _connectionData)
        {
            json = [NSJSONSerialization JSONObjectWithData:_connectionData options:NSJSONReadingMutableContainers error:&error];
        }
        
        if (error || !json)
        {
            NSLog(@"Could not parse loaded json with error:%@", error);
        }
        
        //        NSLog(@"%@", json);
        //        NSLog(@"%@", dataString);
        NSArray *components = [dataString componentsSeparatedByString:@":"];
        NSString *string2 = (NSString*) [[[components objectAtIndex:2] componentsSeparatedByString:@","] objectAtIndex:0];
        retVal = [string2 floatValue];
        _connectionData = nil;
        
    }
    return retVal;
    
    
}
@end
