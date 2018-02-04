#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface Request : NSObject

+ (CGFloat) sentimentForText: (NSString*) text;


@end
