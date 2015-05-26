//
//  UINavigationController+Extra.m
//  Overseas
//
//  Created by YURI_JOU on 15-3-31.
//

#import "UINavigationController+Extra.h"
#import <objc/runtime.h>

static const void *kUseInsideBar = &kUseInsideBar;

@implementation UINavigationController (Extra)
@dynamic alwaysUseInsideBar;

#pragma mark - load
+ (void)load{
  [self.class swizzleMethod:@selector(yg_pushViewController:animated:) withMethod:@selector(pushViewController:animated:)];
}

- (void)yg_pushViewController:(UIViewController *)viewController animated:(BOOL) animated{
  
  [self yg_pushViewController:viewController animated:animated];
  if(self.alwaysUseInsideBar || viewController.useInsideNavigationBarWhenPush){
    [viewController replaceNavigationBarWithInsideBar];
  }
  
}

#pragma mark - accessor
- (BOOL)alwaysUseInsideBar{
  return [objc_getAssociatedObject(self, kUseInsideBar) boolValue];
}

- (void)setAlwaysUseInsideBar:(BOOL)alwaysUseInsideBar{
  objc_setAssociatedObject(self, kUseInsideBar, @(alwaysUseInsideBar), OBJC_ASSOCIATION_ASSIGN);
}

@end
