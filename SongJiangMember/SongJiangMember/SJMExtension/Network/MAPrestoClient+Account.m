//
//  MAPrestoClient+Account.m
//  SongJiangMember
//
//  Created by 王泽剀 on 15/5/26.
//  Copyright (c) 2015年 SongJiang. All rights reserved.
//

#import "MAPrestoClient+Account.h"
#import "NSDictionary+MAPrestoClient.h"


@implementation MAPrestoClient (Account)

//注册
- (void)registerPhone:(NSString *)phone
             Vericode:(NSString*)vericode
             PassWord:(NSString*)password
             completion:(void (^)(id))completion{
    NSDictionary *params = @{
                             @"phone":phone,
                             @"vericode":vericode,
                             @"password":password
                             } ;
    [[MAHttpClient client]post:[@"/member/reg" urlPathComponents]
                       params:[params presto]
                        class:[MAModel class]
                   completion:completion];
}

//登录
- (void)loginPhone:(NSString *)phone
             Password:(NSString*)password
             PushCode:(NSString*)pushCode
           completion:(void (^)(id))completion{
    NSDictionary *params = @{
                             @"phone":phone,
                             @"password":password,
                             @"pushCode":pushCode
                             } ;
    [[MAHttpClient client]post:[@"/member/login" urlPathComponents]
                       params:[params presto]
                        class:[MAModel class]
                   completion:completion];
}


//忘记密码
-(void)forgetPhonePassword:(NSString *)phone
          Vericode:(NSString*)vericode
          PassWord:(NSString*)password
        completion:(void (^)(id))completion{
    
    NSDictionary *params = @{
                             @"phone":phone,
                             @"vericode":vericode,
                             @"password":password
                             } ;
    [[MAHttpClient client]post:[@"/member/forgetpwd" urlPathComponents]
                       params:[params presto]
                        class:[MAModel class]
                   completion:completion];
    
    
    
}

//修改密码
-(void)revisePhonePassword:(NSString *)phone
          OldPwd:(NSString*)oldPwd
          NewPwd:(NSString*)newPwd
        completion:(void (^)(id))completion{
    
    NSDictionary *params = @{
                             @"phone":phone,
                             @"OldPwd":oldPwd,
                             @"NewPwd":newPwd
                             } ;
    [[MAHttpClient client]post:[@"/member/changepwd" urlPathComponents]
                        params:[params presto]
                         class:[MAModel class]
                    completion:completion];
    
    
    
}


//注册推送消息
- (void)registerPushMessage:(NSString *)pushCode
                             completion:(void (^)(id))completion{
    NSDictionary *params = @{
                             @"pushCode":pushCode
                             
                             } ;
    [[MAHttpClient client]post:[@"/member/regpush" urlPathComponents]
                        params:[params presto]
                         class:[MAModel class]
                    completion:completion];
}


//退出登录
- (void)logoutPhone:(NSString *)pushCode
                 completion:(void (^)(id))completion{
    NSDictionary *params = @{
                             @"pushCode":pushCode
                             
                             } ;
    [[MAHttpClient client]post:[@"/member/logout" urlPathComponents]
                        params:[params presto]
                         class:[MAModel class]
                    completion:completion];
}









@end
