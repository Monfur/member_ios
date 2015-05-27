//
//  MAFileManager.m
//  SongJiangMember
//
//  Created by YURI_JOU on 15-5-27.
//  Copyright (c) 2015年 SongJiang. All rights reserved.
//

#import "MAFileManager.h"

@interface MAFileManager()

@property (nonatomic, strong)NSString *cacheHostPath;

@end

@implementation MAFileManager


+ (MAFileManager *)manager{
  static MAFileManager *manager;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    manager = [[MAFileManager alloc]init];
  });
  return manager;
}


- (NSString *)cacheHostPath{
  if (!_cacheHostPath) {
    NSArray *cachePaths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [cachePaths objectAtIndex:0];
    _cacheHostPath = cachePath;
  }
  return _cacheHostPath;
}

- (NSArray *)loadCacheArray:(NSString *)fileName{
  NSString *cachedPath = [[MAFileManager manager].cacheHostPath
                          stringByAppendingPathComponent:fileName];
  NSArray *data = [[NSArray alloc]initWithContentsOfFile:cachedPath];
  return data;
}

- (NSDictionary *)loadCacheFile:(NSString *)fileName{
  NSString *cachedPath = [[MAFileManager manager].cacheHostPath
                          stringByAppendingPathComponent:fileName];
  NSDictionary *data = [[NSDictionary alloc]initWithContentsOfFile:cachedPath];
  return data;
}

- (void)loadCacheModel:(NSString *)fileName completion:(void(^)(id model)) completion{
  NSDictionary *data = [[MAFileManager manager] loadCacheFile:fileName];
  if (!data) {
    return;
  }
  MAModel *model = [[MAModel alloc]initWithDictionary:data];
  if (completion) {
    completion(model);
  }
}

@end
