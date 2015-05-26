//
//  HOEAppLauncher.h
//  HomeExpress
//
//  Created by YURI_JOU on 15-4-12.
//  Copyright (c) 2015年 mnf. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MATabbarController;
@interface SJMAppLauncher : NSObject

+ (instancetype) launcher;

+ (MATabbarController *)rootMenuController;

@end

@interface SJMAppLauncher(Launch)

//TODO
//+ (void)launch;

@end

@interface SJMAppLauncher(Dispatch)

//TODO
//+ (void)dispatchLogin;
//+ (void)dispatchHome;
//+ (void)dispatchViewController:(UIViewController *)controller;
//+ (void)dispatchViewController:(UIViewController *)controller animated:(BOOL)animated;

@end