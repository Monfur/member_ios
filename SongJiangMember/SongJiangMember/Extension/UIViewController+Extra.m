//
//  UIViewController+Extra.m
//  Overseas
//
//  Created by YURI_JOU on 15-3-6.
//

#import "UIViewController+Extra.h"
#import <objc/runtime.h>

@interface UIViewController()
<
UIGestureRecognizerDelegate,
UINavigationBarDelegate
>

@end

static const void *kInsideNavigationBar = &kInsideNavigationBar;
static const void *kInsideTabBar = &kInsideTabBar;
static const void *kInsideBarWrapperView = &kInsideBarWrapperView;
static const void *kNavPush = &kNavPush;
static const void *kTabBarRoot = &kTabBarRoot;

@implementation UIViewController (Extra)
@dynamic insideNavigationBar;
@dynamic insideBarWrapperView;
@dynamic insideTabBar;
@dynamic useInsideNavigationBarWhenPush;
@dynamic useInsideTabBarWhenRoot;

+(void)load{
  [self swizzleMethod:@selector(viewWillAppear:) withMethod:@selector(yg_viewWillAppear:)];
}

- (void)yg_viewWillAppear:(BOOL)animated{
  [self yg_viewWillAppear:animated];
  if (!self.useInsideTabBarWhenRoot) {
    if (self.navigationController) {
      if (self == self.navigationController.childViewControllers[0]) {
        [self replaceTabbarWithInsideBar];
      }
    }
  }
}

#pragma mark - accessor

- (BOOL)useInsideTabBarWhenRoot{
  return [objc_getAssociatedObject(self, kTabBarRoot) boolValue];
}

- (void)setUseInsideTabBarWhenRoot:(BOOL)useInsideTabBarWhenRoot{
  objc_setAssociatedObject(self, kTabBarRoot, @(useInsideTabBarWhenRoot), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)useInsideNavigationBarWhenPush{
  return [objc_getAssociatedObject(self, kNavPush) boolValue];
}

- (void)setUseInsideNavigationBarWhenPush:(BOOL)useInsideNavigationBarWhenPush{
  objc_setAssociatedObject(self, kNavPush, @(useInsideNavigationBarWhenPush), OBJC_ASSOCIATION_ASSIGN);
}

- (UINavigationBar *)insideNavigationBar{
  return objc_getAssociatedObject(self,kInsideNavigationBar);
}

- (void) setInsideNavigationBar:(UINavigationBar *)insideNavigationBar{
  objc_setAssociatedObject(self, kInsideNavigationBar, insideNavigationBar, OBJC_ASSOCIATION_RETAIN_NONATOMIC) ;
}

- (UITabBar *)insideTabBar{
  return objc_getAssociatedObject(self, kInsideTabBar);
}

- (void)setInsideTabBar:(UITabBar *)insideTabBar{
  objc_setAssociatedObject(self, kInsideTabBar, insideTabBar, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)insideBarWrapperView{
  UIView *wrapperView = objc_getAssociatedObject(self, kInsideBarWrapperView);
  if (!wrapperView) {
    wrapperView = [[UIView alloc]initWithFrame:CGRectZero];
    [wrapperView setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:wrapperView];
    [self setInsideBarWrapperView:wrapperView];
  }
  return wrapperView;
}

- (void)setInsideBarWrapperView:(UIView *)insideBarWrapperView{
  objc_setAssociatedObject(self, kInsideBarWrapperView, insideBarWrapperView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - interface
- (void)setTitleColor:(UIColor *)color{
  self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:color};
}

- (void)setLeftButtonItemWithImage:(UIImage *)image actionBlock:(void(^)()) actionBlock{
  self.navigationItem.leftBarButtonItems = [UIBarButtonItem barButtonItemsWithImage:image
                                                                        actionBlock:actionBlock];
}

- (void)setRightButtonItemsWithImage:(UIImage *)image actionBlock:(void (^)())actionBlock{
  self.navigationItem.rightBarButtonItems = [UIBarButtonItem barButtonItemsWithImage:image
                                                                         actionBlock:actionBlock];
}

- (void)setLeftButtonItemsHidden{
  [self setLeftButtonItemsWithTitle:@"" actionBlock:nil];
}

- (void)setRightButtonItemsHidden{
  [self setRightButtonItemsWithTitle:@"" actionBlock:nil];
}

- (void)setLeftButtonItemsWithTitle:(NSString *)title actionBlock:(void (^)())actionBlock{
  self.navigationItem.leftBarButtonItems = [UIBarButtonItem barButtonItemsWithTitle:title
                                                                        actionBlock:actionBlock];
}

- (void)setRightButtonItemsWithTitle:(NSString *)title actionBlock:(void (^)())actionBlock{
  self.navigationItem.rightBarButtonItems = [UIBarButtonItem barButtonItemsWithTitle:title
                                                                         actionBlock:actionBlock];
}

#pragma mark - replace navigation bar
- (UINavigationBar *)replaceNavigationBarWithInsideBar{
  
  if(!self.navigationController.navigationBar) return nil;
  if (self.insideNavigationBar) return self.insideNavigationBar;
  
  [self.navigationController setNavigationBarHidden:YES animated:NO];
  CGFloat height = RectHeight(self.navigationController.navigationBar.frame) +
                   RectHeight([UIApplication sharedApplication].statusBarFrame);
  CGRect frame = self.navigationController.navigationBar.frame;
  UINavigationBar *navigationBar = [[UINavigationBar alloc]initWithFrame:frame];
  self.insideNavigationBar = navigationBar;
  [navigationBar setFrameOriginY:0.0f];
  [navigationBar setFrameHeight:height];
  navigationBar.translucent = self.navigationController.navigationBar.translucent;
  if (((self.edgesForExtendedLayout & UIRectEdgeNone  ) == UIRectEdgeNone) |
      ((self.edgesForExtendedLayout & UIRectEdgeBottom) == UIRectEdgeBottom) ) {
    
    UIView *wrapperView = self.insideBarWrapperView;
    
    [wrapperView mas_updateConstraints:^(MASConstraintMaker *make) {
      make.top.mas_equalTo(height);
      make.left.and.right.equalTo(self.view);
      if (!self.insideTabBar) {
        make.bottom.equalTo(self.view);
      }
      
    }];
    for(UIView *view in self.view.subviews){
      if (view == wrapperView) {
        continue;
      }
      if (CGRectEqualToRect(view.frame, self.view.bounds)) {
        [view setFrameHeight:CGRectGetHeight(view.frame) - 64.0f];
      }
      [wrapperView addSubview:view];
     [self yg_remakeConstrains:view wrapperView:wrapperView];
    }
  }

  //push previous navigationItem
  NSArray *controllers = self.navigationController.viewControllers;
  NSInteger prePos = controllers.count - 2;
  if (prePos >= 0) {
    UIViewController *preController = controllers[prePos];
    UINavigationItem *item = [[UINavigationItem alloc]initWithTitle:preController.navigationItem.title];
    [navigationBar pushNavigationItem:item animated:NO];
  }
  [navigationBar pushNavigationItem:self.navigationItem animated:NO];
  navigationBar.titleTextAttributes =  self.navigationController.navigationBar.titleTextAttributes;
  
  //stroke tintColor for navigationbar
  if ([UIDevice currentDevice].systemVersion.floatValue >= 7.0) {
      navigationBar.barTintColor = self.navigationController.navigationBar.barTintColor;
  }else{
    UIImage *metricImage = [UIImage imageWithColor:self.navigationController.navigationBar.barTintColor];
    [navigationBar setBackgroundImage:metricImage
                        forBarMetrics:UIBarMetricsDefault];
    navigationBar.clipsToBounds = YES;
  }
  
  //reset pan back delegate to self for navigationbar is hidden
  __weak typeof(self) weakSelf = self;
  self.navigationController.interactivePopGestureRecognizer.delegate = weakSelf;
  //naviagation item pop delegate
  navigationBar.delegate = weakSelf;
  [self.view addSubview:navigationBar];
  return navigationBar;
}

#pragma mark - replace tabbar

- (UITabBar *)replaceTabbarWithInsideBar{
  self.edgesForExtendedLayout = UIRectEdgeBottom;
  UITabBar *tabbar =
  self.tabBarController.tabBar ? self.tabBarController.tabBar : self.navigationController.tabBarController.tabBar;
  
  tabbar.hidden = YES;
  if (!tabbar) return nil;
  CGFloat height = CGRectGetHeight(tabbar.frame);
  UITabBar *insideBar = [[UITabBar alloc]initWithFrame:CGRectZero];
  UIView *wrapperView = self.insideBarWrapperView;
  [wrapperView mas_updateConstraints:^(MASConstraintMaker *make) {
    if (self.insideNavigationBar) {
      make.top.mas_equalTo(
                           ({CGFloat height = RectHeight(self.navigationController.navigationBar.frame) +
        RectHeight([UIApplication sharedApplication].statusBarFrame);
        height;
      }));
      make.left.and.right.equalTo(self.view);
      make.bottom.equalTo(self.view).offset(-height);
    }
  }];
  [wrapperView updateConstraintsIfNeeded];
  
  [insideBar setItems:tabbar.items];
  insideBar.selectedItem = tabbar.selectedItem;
  insideBar.translucent = tabbar.translucent;
  [self.view addSubview:insideBar];
  [insideBar mas_makeConstraints:^(MASConstraintMaker *make) {
    make.height.mas_equalTo(height);
    make.left.and.right.equalTo(wrapperView);
    make.top.equalTo(wrapperView.mas_bottom);
  }];
  
  self.insideTabBar = insideBar;
  return insideBar;
}

#pragma mark - delegate
- (BOOL)navigationBar:(UINavigationBar *)navigationBar shouldPopItem:(UINavigationItem *)item{
  [self.navigationController popViewControllerAnimated:YES];
  return YES;
}

#pragma mark - private method
- (void) yg_remakeConstrains:(UIView *)view wrapperView:(UIView *)wrapperView{
  for(NSLayoutConstraint *con in self.view.constraints){
    if (con.firstItem == view && con.firstAttribute == NSLayoutAttributeTop) {
      [self yg_updateConstraint:^MASConstraint *(MASConstraintMaker *make) {
        return make.top;
      } layoutConstraint:con byView:view wrapper:wrapperView ];
    }
    else if (con.firstItem == view && con.firstAttribute == NSLayoutAttributeBottom) {
      [self yg_updateConstraint:^MASConstraint *(MASConstraintMaker *make) {
        return make.bottom;
      } layoutConstraint:con byView:view wrapper:wrapperView];
    }
  }
}

-(void)yg_updateConstraint:(MASConstraint *(^)(MASConstraintMaker *make)) block layoutConstraint:(NSLayoutConstraint *)layoutCon byView:(UIView *) view wrapper:(UIView *)wrapper{
  [self.view removeConstraint:layoutCon];
  [view mas_updateConstraints:^(MASConstraintMaker *make) {
    switch (layoutCon.relation) {
      case NSLayoutRelationEqual:

        block(make).equalTo(wrapper).offset(layoutCon.constant);
        break;
      case NSLayoutRelationGreaterThanOrEqual:
        block(make).greaterThanOrEqualTo(wrapper).offset(layoutCon.constant);
        break;
      case NSLayoutRelationLessThanOrEqual:
        block(make).lessThanOrEqualTo(wrapper).offset(layoutCon.constant);
      default:
        break;
    }
  }];

}



@end
