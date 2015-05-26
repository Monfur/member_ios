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
-(void)getShopListByLon:(double)lon
                    lat:(double)lat
                   type:(NSInteger)type
                   page:(NSInteger)page
                  count:(NSInteger)count
             completion:(void (^)(id))completion;{
    NSDictionary *params = @{
                             @"lon":@(lon),
                             @"lat":@(lat),
                             @"type":@(type),
                             @"page":@(page),
                             @"pageSize":@(count),
                             };

    [[MAHttpClient client]post:[@"/shop/list" urlPathComponents]
                        params:[params presto]
                         class:[MAModel class]
                    completion:completion];
    
}


//搜索商家
-(void)searchShop:(NSString*)keyword
             page:(NSInteger)page
            count:(NSInteger)count
       completion:(void (^)(id))completion;{
    NSDictionary *params = @{
                             @"q":keyword,
                             @"page":@(page),
                             @"pageSize":@(count),
                             };
    
    [[MAHttpClient client]post:[@"/shop/search" urlPathComponents]
                        params:[params presto]
                         class:[MAModel class]
                    completion:completion];
}



//获取商家详情
-(void)getShopDetail:(NSString*)shopId
          completion:(void (^)(id))completion;{
    NSDictionary *params = @{
                             @"shopId":shopId,
                            };
    
    [[MAHttpClient client]post:[@"/shop/sbyid" urlPathComponents]
                        params:[params presto]
                         class:[MAModel class]
                    completion:completion];
    
}



@end
