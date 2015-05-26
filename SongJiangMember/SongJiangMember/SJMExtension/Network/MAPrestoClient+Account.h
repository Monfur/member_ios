//
//  MAPrestoClient+Account.h
//  SongJiangMember
//
//  Created by 王泽剀 on 15/5/26.
//  Copyright (c) 2015年 SongJiang. All rights reserved.
//

#import "MAPrestoClient.h"

@interface MAPrestoClient (Account)


//注册
- (void)registerPhone:(NSString *)phone
             Vericode:(NSString*)vericode
             PassWord:(NSString*)password
           completion:(void (^)(id))completion;

//登录
- (void)loginPhone:(NSString *)phone
          Password:(NSString*)password
          PushCode:(NSString*)pushCode
        completion:(void (^)(id))completion;


//忘记密码
-(void)forgetPhonePassword:(NSString *)phone
          Vericode:(NSString*)vericode
          PassWord:(NSString*)password
        completion:(void (^)(id))completion;


//修改密码
-(void)revisePhonePassword:(NSString *)phone
                    OldPwd:(NSString*)oldPwd
                    NewPwd:(NSString*)newPwd
                completion:(void (^)(id))completion;

//注册推送消息
- (void)registerPushMessage:(NSString *)pushCode
                 completion:(void (^)(id))completion;


//退出登录
- (void)logoutPhone:(NSString *)pushCode
         completion:(void (^)(id))completion;










@end
