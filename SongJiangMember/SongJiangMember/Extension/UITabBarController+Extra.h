//
//  UITabBarController+Extra.h
//  Overseas
//
//  Created by YURI_JOU on 15-3-17.
//

#import <UIKit/UIKit.h>

@interface UITabBarController (Extra)

@property (nonatomic, assign) BOOL hidden;

- (void)setTabbarHidden:(BOOL)hidden animate:(BOOL)animate;

@end
