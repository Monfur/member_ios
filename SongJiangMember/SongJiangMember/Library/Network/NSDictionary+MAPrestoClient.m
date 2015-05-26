//
//  NSDictionary+MAPrestoClient.m
//  SongJiangMember
//
//  Created by YURI_JOU on 15-5-26.
//  Copyright (c) 2015年 SongJiang. All rights reserved.
//

#import "NSDictionary+MAPrestoClient.h"
#import <objc/runtime.h>
@interface NSDictionary()

@end

static const void *kPrestoParams = &kPrestoParams;
@implementation NSDictionary (MAPrestoClient)
@dynamic prestoParams;

#pragma mark - accessor

- (NSDictionary *)prestoParams{
  NSDictionary *params = objc_getAssociatedObject(self, kPrestoParams);
  if (!params) {
    params = @{
               @"userId":@"123",      //学生编号,没有时传null或""
               @"platform":@"an",     //平台类型  安卓：an，ios：ios
               @"v":@"1.0",           //客户端版本号
               @"uuid":@"",           //客户端手机唯一标识
               @"accessToken":@""     //用来验证客户端身份，由特定信息拼接加密而成,没有则传null或""
               };
  }
  return params;
}

- (void)setPrestoParams:(NSDictionary *)prestoParams{
  if (!prestoParams) {
    return;
  }
  objc_setAssociatedObject(self, kPrestoParams, prestoParams, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - modify presto params

- (void)setUUid:(NSString *)uuid{
  
  NSMutableDictionary *params = [self.prestoParams mutableCopy];
  params[@"uuid"] = uuid;
  [self setPrestoParams:[params copy]];
}

- (void)setToken:(NSString *)token{
  
  NSMutableDictionary *params = [self.prestoParams mutableCopy];
  params[@"accessToken"] = token;
  [self setPrestoParams:[params copy]];
}

- (void)setUserId:(NSString *)userId{
  
  NSMutableDictionary *params = [self.prestoParams mutableCopy];
  params[@"userId"] = userId;
  [self setPrestoParams:[params copy]];
}

- (NSDictionary *)presto{
  
  [self setValuesForKeysWithDictionary:[self.prestoParams mutableCopy]];
  return self;
}

@end
