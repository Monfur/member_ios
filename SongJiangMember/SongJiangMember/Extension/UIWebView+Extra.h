//
//  UIWebView+Extra.h
//  Overseas
//
//  Created by YURI_JOU on 15-3-17.
//

#import <UIKit/UIKit.h>

@interface UIWebView (Extra)

@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UIView *footerView;

+ (UIWebView *)plainWebView;

@end
