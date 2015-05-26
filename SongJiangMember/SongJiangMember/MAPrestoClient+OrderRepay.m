//
//  MAPrestoClient+OrderRepay.m
//  SongJiangMember
//
//  Created by 王泽剀 on 15/5/26.
//  Copyright (c) 2015年 SongJiang. All rights reserved.
//

#import "MAPrestoClient+OrderRepay.h"
#import "NSDictionary+MAPrestoClient.h"

@implementation MAPrestoClient (OrderRepay)

//生成支付宝链接接口
-(void)OrderRepay:(NSString*)amount
               Token:(NSString*)token
               completion:(void (^)(id))completion{
    NSDictionary *params = @{@"amount":amount,
                             @"token":token,
                             };
    
    [[MAHttpClient client]post:[@"/order/repay" urlPathComponents]
                        params:[params presto]
                         class:[MAModel class]
                    completion:completion];
    
}


//按年获取有账单的月份儿
-(void)getBillYear:(NSString*)year
                  completion:(void (^)(id))completion{
    NSDictionary *params = @{
                             @"year":year,
                             
                             };
    
    [[MAHttpClient client]post:[@"/order/querymonth" urlPathComponents]
                        params:[params presto]
                         class:[MAModel class]
                    completion:completion];
    
}


//按月取账单
-(void)getBillMonth:(NSString*)year
                    Month:(NSString*)month
                    completion:(void (^)(id))completion{
    NSDictionary *params = @{
                             @"year":year,
                             @"month":month
                             };
    
    [[MAHttpClient client]post:[@"/order/querybydate" urlPathComponents]
                        params:[params presto]
                         class:[MAModel class]
                    completion:completion];
    
}













@end
