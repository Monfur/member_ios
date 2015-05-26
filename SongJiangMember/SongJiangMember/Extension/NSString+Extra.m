//
//  NSString+Extra.m
//  Overseas
//
//  Created by YURI_JOU on 15-3-7.
//

#import "NSString+Extra.h"

@implementation NSString (Extra)

- (NSString *)stringByDeletingWhiteSpace{
  return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (NSString *)urlPathComponents{

  if (![self hasPrefix:@"/"]) {
    return  [NSString stringWithFormat:@"/%@",[self stringByDeletingWhiteSpace]];
  }
  return [self stringByDeletingWhiteSpace];
}

- (NSInteger)linesOfFont:(UIFont *)font width:(CGFloat)width{
  CGRect rect = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{NSFontAttributeName : font}
                                     context:nil];
    
  return ceil(rect.size.height / font.lineHeight);
}

- (CGFloat)heightOfFont:(UIFont *)font width:(CGFloat)width{
  CGRect rect = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                   options:NSStringDrawingUsesLineFragmentOrigin
                                attributes:@{NSFontAttributeName : font}
                                   context:nil];
  return rect.size.height;
}

@end
