//
//  MAPrestoClient+Shop.h
//  SongJiangMember
//
//  Created by 王泽剀 on 15/5/26.
//  Copyright (c) 2015年 SongJiang. All rights reserved.
//

#import "MAPrestoClient.h"

@interface MAPrestoClient (Shop)

//获取商家列表
-(void)getShopListByLon:(double)lon
               lat:(double)lat
              type:(NSInteger)type
              page:(NSInteger)page
          count:(NSInteger)count
        completion:(void (^)(id))completion;

//搜索商家
-(void)searchShop:(NSString*)keyword
             page:(NSInteger)page
            count:(NSInteger)count
       completion:(void (^)(id))completion;

//获取商家详情
-(void)getShopDetail:(NSString*)shopId
          completion:(void (^)(id))completion;

@end
