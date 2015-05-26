//
//  UITabBarController+Extra.m
//  Overseas
//
//  Created by YURI_JOU on 15-3-17.
//

#import "UITabBarController+Extra.h"
#import <objc/runtime.h>

static const void *kHidden = &kHidden;
@implementation UITabBarController (Extra)
@dynamic hidden;

- (BOOL)hidden{
  return [objc_getAssociatedObject(self, kHidden) boolValue];
}

- (void)setHidden:(BOOL)hidden{
  objc_setAssociatedObject(self, kHidden, @(hidden),OBJC_ASSOCIATION_ASSIGN);
}

- (void)setTabbarHidden:(BOOL)hidden animate:(BOOL)animate{
  if (self.hidden == hidden) {
    return;
  }
  [UIView animateWithDuration:0.15f animations:^{
    if (hidden) {
        [self.tabBar setFrameOriginY:CGRectGetMinY(self.tabBar.frame) + CGRectGetHeight(self.tabBar.frame)];
    }else{
        [self.tabBar setFrameOriginY:CGRectGetMinY(self.tabBar.frame) - CGRectGetHeight(self.tabBar.frame)];
    }
  }];
  self.hidden = hidden;
}

@end
