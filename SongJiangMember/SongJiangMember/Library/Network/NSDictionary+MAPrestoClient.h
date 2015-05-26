//
//  NSDictionary+MAPrestoClient.h
//  SongJiangMember
//
//  Created by YURI_JOU on 15-5-26.
//  Copyright (c) 2015年 SongJiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (MAPrestoClient)

@property (nonatomic, strong)NSDictionary *prestoParams;

- (void)setUUid:(NSString *)uuid;
- (void)setToken:(NSString *)token;
- (void)setUserId:(NSString *)userId;

- (NSDictionary *)presto;

@end
