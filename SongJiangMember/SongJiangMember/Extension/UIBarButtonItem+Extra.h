//
//  UIBarButtonItem+Extra.h
//  Overseas
//
//  Created by YURI_JOU on 15-3-6.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extra)

+ (NSArray *)barButtonItemsWithImage:(UIImage *)image actionBlock:(void(^)()) actionBlock;
+ (NSArray *)barButtonItemsWithTitle:(NSString *)title actionBlock:(void(^)()) actionBlock;

+ (NSArray *)barButtonItemsWithCustomView:(UIView *)customView;
+ (NSArray *)barButtonItemsWithCustomView:(UIView *)customView space:(CGFloat)space;

@end
