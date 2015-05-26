//
//  NSDate+Extra.m
//  Overseas
//
//  Created by YURI_JOU on 15-3-8.
//

#import "NSDate+Extra.h"

@implementation NSDate (Extra)

- (NSString *)stringWithDateFormatString:(NSString *)formateString
{
  NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
  
  NSLocale * locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_Hans"];
  [formatter setLocale:locale];
  [formatter setTimeZone:[NSTimeZone localTimeZone]];
  
  [formatter setDateFormat:formateString];
  return [formatter stringFromDate:self];
}

+ (NSDate *)dateWithString:(NSString *)string
           formatterString:(NSString *)formatterString
{
  NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
  
  NSLocale * locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_Hans"];
  [formatter setLocale:locale];
  [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
  
  [formatter setDateFormat:formatterString];
  return [formatter dateFromString:string];
}

@end
