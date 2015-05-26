//
//  UIButton+Extra.h
//  Overseas
//
//  Created by YURI_JOU on 15-3-13.
//

#import <UIKit/UIKit.h>

@interface UIButton (Extra)

- (void)setImage:(UIImage *)image withTitle:(NSString *)title forState:(UIControlState)state;

- (void)setImage:(UIImage *)image withAttributedTitle:(NSMutableAttributedString *)title forState:(UIControlState)state;

@end
