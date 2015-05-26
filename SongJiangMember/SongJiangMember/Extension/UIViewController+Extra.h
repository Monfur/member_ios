//
//  UIViewController+Extra.h
//  Overseas
//
//  Created by YURI_JOU on 15-3-6.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Extra)

//TODO HIDDEN
@property (nonatomic, assign)BOOL useInsideTabBarWhenRoot;
@property (nonatomic, assign)BOOL useInsideNavigationBarWhenPush;
@property (nonatomic, strong)UINavigationBar *insideNavigationBar;
@property (nonatomic, strong)UITabBar *insideTabBar;
@property (nonatomic, strong)UIView *insideBarWrapperView;

- (void)setTitleColor:(UIColor *)color;

- (void)setLeftButtonItemsHidden;
- (void)setLeftButtonItemWithImage:(UIImage *)image actionBlock:(void(^)()) actionBlock;
- (void)setLeftButtonItemsWithTitle:(NSString *)title actionBlock:(void(^)()) actionBlock;

- (void)setRightButtonItemsHidden;
- (void)setRightButtonItemsWithImage:(UIImage *)image actionBlock:(void(^)()) actionBlock;
- (void)setRightButtonItemsWithTitle:(NSString *)title actionBlock:(void(^)()) actionBlock;

//replace navigationbar with custom inside navigationbar
- (UINavigationBar *)replaceNavigationBarWithInsideBar;

//replace tabbar with custom inside tabbar
- (UITabBar *)replaceTabbarWithInsideBar;

@end
