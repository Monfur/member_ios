//
//  MAZonesManager.h
//  Overseas
//
//  Created by YURI_JOU on 15-3-18.
//

#import "MAObject.h"

@interface MAZonesManager : MAObject

@property (nonatomic, strong) NSDictionary *zonesDict;

+ (instancetype)zones;

- (NSInteger)zoneNumberOfTag:(NSString *)key;

@end
