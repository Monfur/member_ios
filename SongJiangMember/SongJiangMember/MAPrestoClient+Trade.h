//
//  MAPrestoClient+Trade.h
//  SongJiangMember
//
//  Created by 王泽剀 on 15/5/26.
//  Copyright (c) 2015年 SongJiang. All rights reserved.
//

#import "MAPrestoClient.h"

@interface MAPrestoClient (Trade)


//设置交易密码
-(void)setTradePassword:(NSString*)tradePwd
               completion:(void (^)(id))completion;

//修改交易密码
-(void)reviseTradePassword:(NSString*)oldTradePwd
                  newTradePwd:(NSString*)newTradePwd
                  completion:(void (^)(id))completion;

//忘记交易密码
-(void)forgetTradePassword:(NSString*)cardId
                  vericode:(NSString*)vericode
                  newTradePwd:(NSString*)newTradePwd
                  completion:(void (^)(id))completion;





@end
