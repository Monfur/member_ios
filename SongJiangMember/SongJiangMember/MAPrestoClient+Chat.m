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

//获取聊天记录
-(void)getChatList:(NSInteger)page
                   PageSize:(NSInteger)pageSize
                   completion:(void (^)(id))completion{
    NSDictionary *params = @{
                             @"page":[NSString stringWithFormat:@"%d",page],
                             @"pageSize":[NSString stringWithFormat:@"%d",pageSize],
                             
                             };
    
    [[MAHttpClient client]post:[@"/msg/list" urlPathComponents]
                        params:[params presto]
                         class:[MAModel class]
                    completion:completion];
    
}


//反馈信息
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
