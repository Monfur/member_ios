//
//  SJMChcheManager.h
//  SongJiangMember
//
//  Created by 王泽剀 on 15/6/1.
//  Copyright (c) 2015年 SongJiang. All rights reserved.
//

#import "SJMChche.h"

@interface SJMChcheManager : SJMChche


+ (instancetype)prestoManager;

- (void)prepareFileByFileName:(NSString *)fileName
                        class:(Class)class
                        completion:(void (^)(id))completion;


@end
