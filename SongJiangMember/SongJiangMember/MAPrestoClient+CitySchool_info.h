//
//  MAPrestoClient+CitySchool_info.h
//  SongJiangMember
//
//  Created by 王泽剀 on 15/5/26.
//  Copyright (c) 2015年 SongJiang. All rights reserved.
//

#import "MAPrestoClient.h"

@interface MAPrestoClient (CitySchool_info)

//获取城市列表
-(void)getCityList:(NSString*)tradePwd
        completion:(void (^)(id))completion;

//获取学校列表
-(void)getSchoolList:(NSString*)Id
                 Lon:(double)lon
                 Lat:(double)lat
          completion:(void (^)(id))completion;

//提交认证信息
-(void)submitInfo:(NSString*)name CardId:(NSString*)cardId Cert:(NSString*)cert
       completion:(void (^)(id))completion;

//学校搜索
-(void)seachSchool:(NSString*)q Page:(NSInteger)page PageSize:(NSInteger)pageSize
        completion:(void (^)(id))completion;

//付款
-(void)payOrder:(NSString*)Id
          Price:(NSString*)price
          Token:(NSString*)token
     completion:(void (^)(id))completion;


@end
