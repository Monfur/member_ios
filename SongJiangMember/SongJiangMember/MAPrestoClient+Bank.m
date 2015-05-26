//
//  MAPrestoClient+Bank.m
//  SongJiangMember
//
//  Created by 王泽剀 on 15/5/26.
//  Copyright (c) 2015年 SongJiang. All rights reserved.
//

#import "MAPrestoClient+Bank.h"
#import "NSDictionary+MAPrestoClient.h"

@implementation MAPrestoClient (Bank)

-(void)getBankList:(NSString*)tradePwd
                   completion:(void (^)(id))completion{
  
    [[MAHttpClient client]post:[@"/bank/list" urlPathComponents]
                        params:[@{} presto]
                         class:[MAModel class]
                         completion:completion];
    
}

-(void)bindBankCard:(NSString*)bankId
                    card:(NSString*)card
                    sub:(NSString*)sub
                    completion:(void (^)(id))completion{
  
    NSDictionary *params = @{@"bankId":bankId,
                             @"card":card,
                             @"sub":sub
                             };
  
    [[MAHttpClient client]post:[@"/bank/bindcard" urlPathComponents]
                        params:[params presto]
                         class:[MAModel class]
                         completion:completion];
    
}


-(void)unBindBankCard:(NSString*)bankCardId
                      completion:(void (^)(id))completion{
  
    NSDictionary *params = @{
                             @"bankCardId":bankCardId,
                             };
    
    
    [[MAHttpClient client]post:[@"/bank/unbindcard" urlPathComponents]
                        params:[params presto]
                         class:[MAModel class]
                         completion:completion];
    
}

-(void)getBindBankList:(NSString*)tradePwd
                       completion:(void (^)(id))completion{
  
    [[MAHttpClient client]post:[@"/bank/bindlis" urlPathComponents]
                        params:[@{} presto]
                         class:[MAModel class]
                         completion:completion];
    
}


-(void)withdraw:(NSString*)money
                token:(NSString*)token
                completion:(void (^)(id))completion{
    NSDictionary *params = @{
                             @"money":money,
                             @"token":token
                             };
    
    [[MAHttpClient client]post:[@"/withdraw/subwdra" urlPathComponents]
                        params:[params presto]
                         class:[MAModel class]
                    completion:completion];
    
}







@end
