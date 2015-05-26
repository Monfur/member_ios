//
//  MAPrestoClient+Chat.h
//  SongJiangMember
//
//  Created by 王泽剀 on 15/5/26.
//  Copyright (c) 2015年 SongJiang. All rights reserved.
//

#import "MAPrestoClient.h"

@interface MAPrestoClient (Chat)

//获取聊天记录
-(void)getChatList:(NSInteger)page
          count:(NSInteger)count
        completion:(void (^)(id))completion;

//反馈信息
-(void)msgInfo:(NSString*)msg
    completion:(void (^)(id))completion;




@end
