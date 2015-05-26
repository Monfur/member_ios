//
//  UIImage+Extra.m
//  Overseas
//
//  Created by YURI_JOU on 15-3-5.
//

#import "UIImage+Extra.h"

@implementation UIImage (Extra)

+ (UIImage *)imageWithColor:(UIColor *)color{
  CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
  UIGraphicsBeginImageContext(rect.size);
  CGContextRef context = UIGraphicsGetCurrentContext();
  CGContextSetFillColorWithColor(context, [color CGColor]);
  CGContextFillRect(context, rect);
  
  UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return theImage;
}

+ (UIImage *) imageWithoutRendering:(NSString *)imageName{
  UIImage *image = [UIImage imageNamed:imageName];
  UIImage *original = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
  return original;
}

@end
