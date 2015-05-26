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


- (void)registerPhone:(NSString *)phone
             vericode:(NSString*)vericode
             passWord:(NSString*)password
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


- (void)loginPhone:(NSString *)phone
             password:(NSString*)password
             pushCode:(NSString*)pushCode
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


-(void)forgetPhonePassword:(NSString *)phone
          vericode:(NSString*)vericode
          passWord:(NSString*)password
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


-(void)revisePhonePassword:(NSString *)phone
          oldPwd:(NSString*)oldPwd
          newPwd:(NSString*)newPwd
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
