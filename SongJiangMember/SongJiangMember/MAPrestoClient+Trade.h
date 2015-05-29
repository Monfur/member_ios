//
//  MAPrestoClient+Trade.h
//  SongJiangMember
//
//  Created by 王泽剀 on 15/5/26.
//  Copyright (c) 2015年 SongJiang. All rights reserved.
//

#import "MAPrestoClient.h"

@interface MAPrestoClient (Trade)


//setting trade password
-(void)setTradePassword:(NSString*)tradePwd
               completion:(void (^)(id))completion;

//modify trade password
-(void)reviseTradePassword:(NSString*)oldTradePwd
                  newTradePwd:(NSString*)newTradePwd
                  completion:(void (^)(id))completion;

//forget trade password
-(void)forgetTradePassword:(NSString*)cardId
                  vericode:(NSString*)vericode
                  newTradePwd:(NSString*)newTradePwd
                  completion:(void (^)(id))completion;





@end
