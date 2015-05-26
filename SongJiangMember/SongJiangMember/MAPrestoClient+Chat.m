//
//  MAPrestoClient+Chat.m
//  SongJiangMember
//
//  Created by 王泽剀 on 15/5/26.
//  Copyright (c) 2015年 SongJiang. All rights reserved.
//

#import "MAPrestoClient+Chat.h"
#import "NSDictionary+MAPrestoClient.h"
@implementation MAPrestoClient (Chat)

-(void)getChatList:(NSInteger)page
             count:(NSInteger)count
        completion:(void (^)(id))completion;{
    NSDictionary *params = @{
                             @"page":@(page),
                             @"pageSize":@(count),
                             };
    
    [[MAHttpClient client]post:[@"/msg/list" urlPathComponents]
                        params:[params presto]
                         class:[MAModel class]
                    completion:completion];
    
}

-(void)msgInfo:(NSString*)msg
               completion:(void (^)(id))completion{
    
    NSDictionary *params = @{
                             @"msg":msg
                             };
    
    [[MAHttpClient client]post:[@"/msg/q" urlPathComponents]
                        params:[params presto]
                         class:[MAModel class]
                    completion:completion];
}

@end
