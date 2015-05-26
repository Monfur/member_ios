//
//  UIFont+Extra.m
//  Overseas
//
//  Created by YURI_JOU on 15-3-6.
//

#import "UIFont+Extra.h"

@implementation UIFont (Extra)

+ (UIFont *)helveticaFontOfSize:(CGFloat)size
{
  return [UIFont fontWithName:@"Helvetica" size:size];
}

+ (UIFont *)helveticaBoldFontOfSize:(CGFloat)size{
  return [UIFont fontWithName:@"Helvetica-Bold" size:size];
}

@end
