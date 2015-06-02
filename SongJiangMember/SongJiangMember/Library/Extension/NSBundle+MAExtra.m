//
//  NSBundle+MAExtra.m
//  Overseas
//
//  Created by YURI_JOU on 15-4-2.
//

#import "NSBundle+MAExtra.h"

@implementation NSBundle (MAExtra)

- (id)getValuesFromPlist:(NSString *)plistName{
  NSURL *url = [self URLForResource:plistName withExtension:@".plist"];
  NSDictionary *plist = [NSDictionary dictionaryWithContentsOfURL:url];
  return plist;
}

- (id)getValuesFromPlist:(NSString *)plistName key:(NSString *)key{
  NSURL *url = [self URLForResource:plistName withExtension:@".plist"];
  NSDictionary *plist = [NSDictionary dictionaryWithContentsOfURL:url];
  if (plist) {
    return plist[key];
  }
  return nil;
}

- (UIImage *)getImageFromBundle:(NSString *)imageName{
  NSArray *separates = [imageName componentsSeparatedByString:@"."];
  NSString *name;
  NSString *extension;
  if (separates.count >2) return nil;
  if (separates.count == 2) {
    name = separates[0];
    extension = [NSString stringWithFormat:@".%@",separates[1]];
  }
  if (!extension) {
    extension = @".png";
  }
  NSURL *url = [self URLForResource:name withExtension:extension];
  NSData *data = [NSData dataWithContentsOfURL:url];
  UIImage *image = [UIImage imageWithData:data];
  return image;
}

@end
