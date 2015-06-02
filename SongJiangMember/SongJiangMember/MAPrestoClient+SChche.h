//
//  MAPrestoClient+SChche.h
//  SongJiangMember
//
//  Created by 王泽剀 on 15/6/1.
//  Copyright (c) 2015年 SongJiang. All rights reserved.
//

#import "MAPrestoClient.h"

@interface MAPrestoClient (SChche)


//获取商家列表
-(void)chche_getShopListByLon:(NSString*)fileName
                      FileUrl:(NSString*)urlstr
                      completion:(void (^)(id))completion;















@end
