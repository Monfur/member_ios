//
//  UITextField+Extra.m
//  Overseas
//
//  Created by YURI_JOU on 15-3-17.
//

#import "UITextField+Extra.h"
@interface UITextField()
<
UITextFieldDelegate
>
@end

@implementation UITextField (Extra)

- (void)setDefaultOffset:(CGFloat)offset{
  UIView *view = [[UIView alloc]initWithFrame:CGRectZero];
  [view setFrameHeight:CGRectGetHeight(self.frame)];
  [view setFrameWidth:offset];
  self.leftView = view;
  self.leftViewMode = UITextFieldViewModeAlways;
}


@end
