//
//  MAPrestoClient+OrderRepay.m
//  SongJiangMember
//
//  Created by 王泽剀 on 15/5/26.
//  Copyright (c) 2015年 SongJiang. All rights reserved.
//

#import "MAPrestoClient+Bill.h"
#import "NSDictionary+MAPrestoClient.h"

@implementation MAPrestoClient (Bill)

-(void)OrderRepay:(NSString*)amount
               token:(NSString*)token
               completion:(void (^)(id))completion{
    NSDictionary *params = @{@"amount":amount,
                             @"token":token,
                             };
    
    [[MAHttpClient client]post:[@"/order/repay" urlPathComponents]
                        params:[params presto]
                         class:[MAModel class]
                    completion:completion];
    
}

-(void)getYearBillByYear:(NSString*)year
              completion:(void (^)(id))completion;{
    NSDictionary *params = @{
                             @"year":year,
                             
                             };
    
    [[MAHttpClient client]post:[@"/order/querymonth" urlPathComponents]
                        params:[params presto]
                         class:[MAModel class]
                    completion:completion];
    
}

-(void)getMonthBillByYear:(NSString*)year
                    month:(NSString*)month
               completion:(void (^)(id))completion;{
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
