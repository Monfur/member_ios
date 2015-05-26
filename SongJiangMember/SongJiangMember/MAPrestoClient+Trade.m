//
//  MAPrestoClient+Trade.m
//  SongJiangMember
//
//  Created by 王泽剀 on 15/5/26.
//  Copyright (c) 2015年 SongJiang. All rights reserved.
//

#import "MAPrestoClient+Trade.h"
#import "NSDictionary+MAPrestoClient.h"

@implementation MAPrestoClient (Trade)

-(void)setTradePassword:(NSString*)tradePwd
               completion:(void (^)(id))completion{
  
    NSDictionary *params = @{
                             @"tradePwd":tradePwd,
                             
                             } ;
     
    [[MAHttpClient client]post:[@"/member/settradepwd" urlPathComponents]
                        params:[params presto]
                         class:[MAModel class]
                    completion:completion];
}

-(void)reviseTradePassword:(NSString*)oldTradePwd
                  newTradePwd:(NSString*)newTradePwd
                  completion:(void (^)(id))completion{
  
    NSDictionary *params = @{
                             @"oldTradePwd":oldTradePwd,
                             @"newTradePwd":newTradePwd
                             } ;
    
    [[MAHttpClient client]post:[@"/member/changetradepwd" urlPathComponents]
                        params:[params presto]
                         class:[MAModel class]
                    completion:completion];
    
    
    
}

-(void)forgetTradePassword:(NSString*)cardId
                  vericode:(NSString*)vericode
                  newTradePwd:(NSString*)newTradePwd
                  completion:(void (^)(id))completion{
  
    NSDictionary *params = @{
                             @"cardId":cardId,
                             @"vericode":vericode,
                             @"newTradePwd":newTradePwd
                             } ;
    
    [[MAHttpClient client]post:[@"/member/forgettradepwd" urlPathComponents]
                        params:[params presto]
                         class:[MAModel class]
                    completion:completion];
    
    
    
}





@end
