//
//  MAPrestoClient+Account.h
//  SongJiangMember
//
//  Created by 王泽剀 on 15/5/26.
//  Copyright (c) 2015年 SongJiang. All rights reserved.
//

#import "MAPrestoClient.h"

@interface MAPrestoClient (Account)


//register
- (void)registerPhone:(NSString *)phone
             vericode:(NSString*)vericode
             passWord:(NSString*)password
           completion:(void (^)(id))completion;

//login
- (void)loginPhone:(NSString *)phone
          password:(NSString*)password
          pushCode:(NSString*)pushCode
        completion:(void (^)(id))completion;


//forget password
-(void)forgetPhonePassword:(NSString *)phone
          vericode:(NSString*)vericode
          passWord:(NSString*)password
        completion:(void (^)(id))completion;


//modify password
-(void)revisePhonePassword:(NSString *)phone
                    oldPwd:(NSString*)oldPwd
                    newPwd:(NSString*)newPwd
                completion:(void (^)(id))completion;

//push notification
- (void)registerPushMessage:(NSString *)pushCode
                 completion:(void (^)(id))completion;


//exit login
- (void)logoutPhone:(NSString *)pushCode
         completion:(void (^)(id))completion;


@end
