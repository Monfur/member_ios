//
//  NSDate+Extra.h
//  Overseas
//
//  Created by YURI_JOU on 15-3-8.
//

#import <Foundation/Foundation.h>

@interface NSDate (Extra)

- (NSString *)stringWithDateFormatString:(NSString *)formateString;
+ (NSDate *)dateWithString:(NSString *)string formatterString:(NSString *)formatterString;

@end
