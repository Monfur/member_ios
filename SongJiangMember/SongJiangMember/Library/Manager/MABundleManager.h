//
//  MABundleManager.h
//  Overseas
//
//  Created by YURI_JOU on 15-4-2.
//

#import "MAObject.h"

@interface MABundleManager : MAObject

+ (MABundleManager *)manager;

- (NSBundle *)defaultBundle;
- (NSBundle *)bundleWithName:(NSString *)bundleName;

@end
