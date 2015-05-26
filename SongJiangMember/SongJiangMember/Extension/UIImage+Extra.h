//
//  UIImage+Extra.h
//  Overseas
//
//  Created by YURI_JOU on 15-3-5.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extra)

//get image from the color
+ (UIImage *)imageWithColor:(UIColor *)color;

// get image original without render tintcolor
+ (UIImage *)imageWithoutRendering:(NSString *)imageName;

@end
