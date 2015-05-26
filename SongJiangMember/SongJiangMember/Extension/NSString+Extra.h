//
//  NSString+Extra.h
//  Overseas
//
//  Created by YURI_JOU on 15-3-7.
//

#import <Foundation/Foundation.h>

@interface NSString (Extra)

- (NSString *)stringByDeletingWhiteSpace;
- (NSString *)urlPathComponents;
- (NSInteger)linesOfFont:(UIFont *)font width:(CGFloat)width;
- (CGFloat)heightOfFont:(UIFont *)font width:(CGFloat)width;

@end
