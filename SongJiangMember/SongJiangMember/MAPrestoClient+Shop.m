//
//  MAPrestoClient+Shop.m
//  SongJiangMember
//
//  Created by 王泽剀 on 15/5/26.
//  Copyright (c) 2015年 SongJiang. All rights reserved.
//

#import "MAPrestoClient+Shop.h"
#import "NSDictionary+MAPrestoClient.h"
@implementation MAPrestoClient (Shop)

//获取商家列表
-(void)getShopList:(double)lon
               Lat:(double)lat
               Type:(NSInteger)type
               Page:(NSInteger)page
               PageSize:(NSInteger)pageSize
               completion:(void (^)(id))completion{
    NSDictionary *params = @{
                             @"lon":[NSString stringWithFormat:@"%lf",lon],
                             @"lat":[NSString stringWithFormat:@"%lf",lat],
                             @"type":[NSString stringWithFormat:@"%d",type],
                             @"page":[NSString stringWithFormat:@"%d",page],
                             @"pageSize":[NSString stringWithFormat:@"%d",pageSize],
                             
                             };

    [[MAHttpClient client]post:[@"/shop/list" urlPathComponents]
                        params:[params presto]
                         class:[MAModel class]
                    completion:completion];
    
}


//搜索商家
-(void)searchShop:(NSString*)q
                  Page:(NSInteger)page
                  PageSize:(NSInteger)pageSize
                  completion:(void (^)(id))completion{
    NSDictionary *params = @{
                             @"q":q,
                             @"page":[NSString stringWithFormat:@"%d",page],
                             @"pageSize":[NSString stringWithFormat:@"%d",pageSize],
                             
                             };
    
    [[MAHttpClient client]post:[@"/shop/search" urlPathComponents]
                        params:[params presto]
                         class:[MAModel class]
                    completion:completion];
    
}



//获取商家详情
-(void)getShopDetail:(NSString*)shopId
          completion:(void (^)(id))completion{
    NSDictionary *params = @{
                             @"shopId":shopId,
                            };
    
    [[MAHttpClient client]post:[@"/shop/sbyid" urlPathComponents]
                        params:[params presto]
                         class:[MAModel class]
                    completion:completion];
    
}



@end
