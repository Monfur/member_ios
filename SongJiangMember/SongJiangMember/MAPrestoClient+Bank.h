//
//  MAPrestoClient+Bank.h
//  SongJiangMember
//
//  Created by 王泽剀 on 15/5/26.
//  Copyright (c) 2015年 SongJiang. All rights reserved.
//

#import "MAPrestoClient.h"

@interface MAPrestoClient (Bank)


//获取银行列表
-(void)getBankList:(NSString*)tradePwd
        completion:(void (^)(id))completion;

//绑定银行卡
-(void)bindBankCard:(NSString*)bankId
               Card:(NSString*)card
                Sub:(NSString*)sub
         completion:(void (^)(id))completion;

//解绑银行卡
-(void)unBindBankCard:(NSString*)bankCardId
           completion:(void (^)(id))completion;

//获取绑定银行卡列表
-(void)getBindBankList:(NSString*)tradePwd
            completion:(void (^)(id))completion;


//提现
-(void)withdraw:(NSString*)money
          Token:(NSString*)token
     completion:(void (^)(id))completion;





@end
