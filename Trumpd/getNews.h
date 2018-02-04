#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface GetNews : NSObject

+ (NSDictionary<NSString* , NSString *>*) getNewsArticles: (NSString*) query;


@end
