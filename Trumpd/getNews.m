#import "getNews.h"

@implementation GetNews

+ (NSDictionary*) getNewsArticles: (NSString*) query {
    NSString* path = @"https://api.cognitive.microsoft.com/bing/v5.0/search";
    NSArray* array = @[
                       // Request parameters
                       @"entities=true",
                       [NSString stringWithFormat:@"q=%@", [query stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLPathAllowedCharacterSet]]],
                       @"count=10",
                       @"offset=0",
                       @"mkt=en-us",
                       @"safesearch=Moderate",
                       ];
    
    NSString* string = [array componentsJoinedByString:@"&"];
    path = [path stringByAppendingFormat:@"?%@", string];
    
    //    NSLog(@"%@", path);
    
    NSMutableURLRequest* _request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:path]];
    [_request setHTTPMethod:@"GET"];
    // Request headers
    [_request setValue:@"841abf9f54a047eda993dc02854111be" forHTTPHeaderField:@"Ocp-Apim-Subscription-Key"];
    // DO NOT NEED Request body for a GET
    
    
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSData* _connectionData = [NSURLConnection sendSynchronousRequest:_request returningResponse:&response error:&error];
    
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
        
        NSDictionary *webPages = json[@"webPages"];
        NSDictionary *first = [webPages[@"value"] firstObject];
        if(first != nil) {
            return @{@"url": first[@"url"], @"snippet": first[@"snippet"]};
        }
        
        //        NSLog(@"%@", json);
        //                NSLog(@"%@", dataString);
        
        _connectionData = nil;
        
    }
    
    return nil;
    
}
@end
