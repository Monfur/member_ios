//
//  HOEAppLauncher.m
//  HomeExpress
//
//  Created by YURI_JOU on 15-4-12.
//  Copyright (c) 2015年 mnf. All rights reserved.
//

#import "SJMAppLauncher.h"


@interface SJMAppLauncher()
<
UITabBarControllerDelegate
>

@end

@implementation SJMAppLauncher

static SJMAppLauncher *shareInstance;
static MATabbarController *tabController;

+ (instancetype) launcher{
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    shareInstance = [[SJMAppLauncher alloc] init];
  });
//    __weak typeof(self) weakSelf= self;
    @weakify(self);
    void(^block)(void) = ^{
        @strongify(self);


        
    };

  return shareInstance;
}


#pragma mark - intialize system

+ (MATabbarController *)rootMenuController{
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    tabController = [[MATabbarController alloc] init];
    tabController.tabBar.tintColor = [UIColor colorWithHexString:@"0x696d77"];
  });
  return tabController;
}

+ (MANavigationController *) decorateController:(MAViewController *)viewController
                                          title:(NSString *)title{
  MANavigationController *navigationController = [[MANavigationController alloc] initWithRootViewController:viewController];
  viewController.title = title;
  [viewController setTitleColor:[UIColor whiteColor]];
  return navigationController;
}

- (BOOL) tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
  
  return YES;
  
}

@end
