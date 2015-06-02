//
//  MAErrorCodeManager.m
//  SongJiangMember
//
//  Created by YURI_JOU on 15-6-2.
//  Copyright (c) 2015年 SongJiang. All rights reserved.
//

#import "MAErrorCodeManager.h"


@interface MAErrorCodeManager()

@property (nonatomic, strong)NSDictionary *errorDescDic;

@end

@implementation MAErrorCodeManager

+ (instancetype)manager{
  static dispatch_once_t onceToken;
  static MAErrorCodeManager *manager;
  dispatch_once(&onceToken, ^{
    manager = [[MAErrorCodeManager alloc]init];
  });
  return manager;
}

- (NSDictionary *)errorDescDic{
  if (!_errorDescDic) {
    _errorDescDic = [[[MABundleManager manager]defaultBundle] getValuesFromPlist:@"error_code"];
  }
  return _errorDescDic;
}

- (NSString *)errorDescWithCode:(NSInteger)code{
  NSString *desc = self.errorDescDic[[NSString stringWithFormat:@"%ld",code]];
  return desc;
}

@end
