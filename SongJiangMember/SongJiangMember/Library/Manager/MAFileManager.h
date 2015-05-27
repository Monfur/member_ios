//
//  MAFileManager.h
//  SongJiangMember
//
//  Created by YURI_JOU on 15-5-27.
//  Copyright (c) 2015年 SongJiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MAFileManager : NSObject

@property (nonatomic, strong, readonly)NSString *cacheHostPath;

+ (MAFileManager *)manager;

- (NSArray *)loadCacheArray:(NSString *)fileName;
- (NSDictionary *)loadCacheDictionary:(NSString *)fileName;

- (void)loadCacheModel:(NSString *)fileName completion:(void(^)(id model)) completion;

@end
