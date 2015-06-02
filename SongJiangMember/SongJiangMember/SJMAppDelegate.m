//
//  AppDelegate.m
//  SongJiangMember
//
//  Created by YURI_JOU on 15-5-25.
//  Copyright (c) 2015年 SongJiang. All rights reserved.
//

#import "SJMAppDelegate.h"
#import "SJMAppLauncher.h"

@interface SJMAppDelegate ()

@end

@implementation SJMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  
  self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
  self.window.rootViewController = [SJMAppLauncher rootMenuController];
  [self.window makeKeyAndVisible];
  
  [[MAErrorCodeManager manager]errorDescWithCode:10001];
  
  return YES;
}

@end
