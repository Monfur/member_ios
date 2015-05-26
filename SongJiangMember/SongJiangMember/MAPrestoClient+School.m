//
//  MAPrestoClient+CitySchool_info.m
//  SongJiangMember
//
//  Created by 王泽剀 on 15/5/26.
//  Copyright (c) 2015年 SongJiang. All rights reserved.
//

#import "MAPrestoClient+School.h"
#import "NSDictionary+MAPrestoClient.h"

@implementation MAPrestoClient (School)

-(void)getCityList:(NSString*)tradePwd
                   completion:(void (^)(id))completion{
  
    NSDictionary *params = @{};
                             
    [[MAHttpClient client]post:[@"/city/list" urlPathComponents]
                        params:[params presto]
                         class:[MAModel class]
                    completion:completion];
}

-(void)getSchoolList:(NSString*)Id
                    lon:(double)lon
                    lat:(double)lat
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


-(void)submitInfo:(NSString*)name
           cardId:(NSString*)cardId
             cert:(NSString*)cert
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

-(void)seachSchool:(NSString*)q
              page:(NSInteger)page
          pageSize:(NSInteger)pageSize
       completion:(void (^)(id))completion{
    NSDictionary *params = @{@"q":q,
                             @"page":@(page),
                             @"pageSize":@(pageSize)
                             };
    
    [[MAHttpClient client]post:[@"/school/queryparam" urlPathComponents]
                        params:[params presto]
                         class:[MAModel class]
                    completion:completion];
    
}

-(void)payOrder:(NSString*)Id
                price:(NSString*)price
                token:(NSString*)token
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
