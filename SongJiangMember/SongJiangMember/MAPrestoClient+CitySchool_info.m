//
//  MAPrestoClient+CitySchool_info.m
//  SongJiangMember
//
//  Created by 王泽剀 on 15/5/26.
//  Copyright (c) 2015年 SongJiang. All rights reserved.
//

#import "MAPrestoClient+CitySchool_info.h"
#import "NSDictionary+MAPrestoClient.h"

@implementation MAPrestoClient (CitySchool_info)



//获取城市列表
-(void)getCityList:(NSString*)tradePwd
                   completion:(void (^)(id))completion{
    NSDictionary *params = @{};
                             
    
    [[MAHttpClient client]post:[@"/city/list" urlPathComponents]
                        params:[params presto]
                         class:[MAModel class]
                    completion:completion];
    
    
    
}


//获取学校列表
-(void)getSchoolList:(NSString*)Id
                    Lon:(double)lon
                    Lat:(double)lat
                    completion:(void (^)(id))completion{
    NSDictionary *params = @{@"id":Id,
                           @"lon":[NSString stringWithFormat:@"%lf",lon],
                           @"lat":[NSString stringWithFormat:@"%lf",lat]
                           };

    
    [[MAHttpClient client]post:[@"/school/list" urlPathComponents]
                        params:[params presto]
                         class:[MAModel class]
                    completion:completion];
    
}


//提交认证信息
-(void)submitInfo:(NSString*)name CardId:(NSString*)cardId Cert:(NSString*)cert
          completion:(void (^)(id))completion{
    NSDictionary *params = @{@"name":name,
                             @"cardId":cardId,
                             @"cert":cert
                             };
    
    
    [[MAHttpClient client]post:[@"/member/verify" urlPathComponents]
                        params:[params presto]
                         class:[MAModel class]
                    completion:completion];
    
}

//学校搜索
-(void)seachSchool:(NSString*)q Page:(NSInteger)page PageSize:(NSInteger)pageSize
       completion:(void (^)(id))completion{
    NSDictionary *params = @{@"q":q,
                             @"page":[NSString stringWithFormat:@"%d",page],
                             @"pageSize":[NSString stringWithFormat:@"%d",pageSize]
                             };
    
    
    [[MAHttpClient client]post:[@"/school/queryparam" urlPathComponents]
                        params:[params presto]
                         class:[MAModel class]
                    completion:completion];
    
}


//付款
-(void)payOrder:(NSString*)Id
                Price:(NSString*)price
                Token:(NSString*)token
                completion:(void (^)(id))completion{
    NSDictionary *params = @{@"id":Id,
                             @"price":price,
                             @"token":token
                             };
    
    
    [[MAHttpClient client]post:[@"/order/pay" urlPathComponents]
                        params:[params presto]
                         class:[MAModel class]
                    completion:completion];
    
}









@end
