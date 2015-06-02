//
//  NSBundle+MAExtra.h
//  Overseas
//
//  Created by YURI_JOU on 15-4-2.
//

#import <Foundation/Foundation.h>

@interface NSBundle (MAExtra)

- (id)getValuesFromPlist:(NSString *)plistName;
- (id)getValuesFromPlist:(NSString *)plistName key:(NSString *)key;
- (UIImage *)getImageFromBundle:(NSString *)imageName;

@end
