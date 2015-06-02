//
//  MAPrestoClient+SChche.m
//  SongJiangMember
//
//  Created by 王泽剀 on 15/6/1.
//  Copyright (c) 2015年 SongJiang. All rights reserved.
//

#import "MAPrestoClient+SChche.h"
#import "NSDictionary+MAPrestoClient.h"

@implementation MAPrestoClient (SChche)


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


-(void)chche_getShopListByLon:(NSString*)fileName
                      FileUrl:(NSString*)urlstr
                      completion:(void (^)(id))completion{
    
    
    [SJMChcheManager prestoManager].folderName = folderNames;
    [SJMChcheManager prestoManager].updateRateUnit = UPDATE_RATEUNIT_ONCE;
    [SJMChcheManager prestoManager].fileURL = urlstr;
    [[SJMChcheManager prestoManager] prepareFileByFileName:fileName class:[SJMExampleModel class] completion:completion ];
    
    
    
    
    
}













@end
