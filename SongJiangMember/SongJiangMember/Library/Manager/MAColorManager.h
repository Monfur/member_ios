//
//  MAColorManager.h
//  Overseas
//
//  Created by YURI_JOU on 15-3-5.
//

#import <Foundation/Foundation.h>

@interface MAColorManager : NSObject

+ (instancetype) sharedManager;

- (UIColor *)defaultForeColor;
- (UIColor *)defaultBackgroundColor;

- (UIColor *)defaultLightColor;
- (UIColor *)defaultDarkColor;

- (UIColor *)defaultLineStrokedColor;

- (UIColor *)colorWithTag:(NSString *)tag;


@end
