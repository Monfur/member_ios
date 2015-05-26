//
//  UIButton+Extra.m
//  Overseas
//
//  Created by YURI_JOU on 15-3-13.
//

#import "UIButton+Extra.h"

@implementation UIButton (Extra)

- (void)setImage:(UIImage *)image withTitle:(NSString *)title forState:(UIControlState)state{
  
  UIEdgeInsets imageInsets = UIEdgeInsetsMake(0,0, 0, 0);
  [self setImageEdgeInsets:imageInsets];
  [self setImage:image forState:state];
  CGSize size = [image size];
  
  self.titleLabel.backgroundColor = [UIColor clearColor];
  self.titleLabel.contentMode = UIControlContentHorizontalAlignmentCenter;
  UIEdgeInsets titleInsets = UIEdgeInsetsMake(0, size.width, 0, 0);
  [self setTitleEdgeInsets:titleInsets];
  [self setTitle:title forState:state];
}

- (void)setImage:(UIImage *)image withAttributedTitle:(NSMutableAttributedString *)title forState:(UIControlState)state{
  
  UIEdgeInsets imageInsets = UIEdgeInsetsMake(0,0, 0, 0);
  [self setImageEdgeInsets:imageInsets];
  [self setImage:image forState:state];
  CGSize size = [image size];
  
  self.titleLabel.backgroundColor = [UIColor clearColor];
  self.titleLabel.contentMode = UIControlContentHorizontalAlignmentCenter;
  UIEdgeInsets titleInsets = UIEdgeInsetsMake(0, size.width, 0, 0);
  [self setTitleEdgeInsets:titleInsets];
  [self setAttributedTitle:title forState:state];
}

@end
