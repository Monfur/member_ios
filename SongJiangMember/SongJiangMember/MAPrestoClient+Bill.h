//
//  MAPrestoClient+OrderRepay.h
//  SongJiangMember
//
//  Created by 王泽剀 on 15/5/26.
//  Copyright (c) 2015年 SongJiang. All rights reserved.
//

#import "MAPrestoClient.h"

@interface MAPrestoClient (Bill)

//生成支付宝链接接口
-(void)OrderRepay:(NSString*)amount
            token:(NSString*)token
       completion:(void (^)(id))completion;


//按年获取有账单的月份儿
-(void)getYearBillByYear:(NSString*)year
        completion:(void (^)(id))completion;

//按月取账单
-(void)getMonthBillByYear:(NSString*)year
              month:(NSString*)month
         completion:(void (^)(id))completion;


@end
