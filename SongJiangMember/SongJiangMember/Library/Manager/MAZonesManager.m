//
//  MAZonesManager.m
//  Overseas
//
//  Created by YURI_JOU on 15-3-18.
//

#import "MAZonesManager.h"

@implementation MAZonesManager
static MAZonesManager *sharedInstance;

+ (instancetype)zones{
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedInstance = [[self.class alloc]init];
  });
  return sharedInstance;
}

- (instancetype)init{
  self = [super init];
  if (self) {
    self.zonesDict = [[MABundleManager manager].defaultBundle getValuesFromPlist:@"zones" key:@"zones"];
  }
  return self;
}

- (NSInteger)zoneNumberOfTag:(NSString *)key{
  return [self.zonesDict[key] integerValue];
}

@end
