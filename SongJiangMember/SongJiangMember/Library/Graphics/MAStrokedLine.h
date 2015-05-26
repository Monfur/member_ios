//
//  MAStrokedLine.h
//  Overseas
//
//  Created by YURI_JOU on 15-3-12.
//

#import <UIKit/UIKit.h>

@interface MAStrokedLine : UIView

- (instancetype)initWithColor:(UIColor *)color width:(CGFloat)width;

@property (nonatomic, assign) CGFloat width;
@property (nonatomic, strong) UIColor *color;

@end
