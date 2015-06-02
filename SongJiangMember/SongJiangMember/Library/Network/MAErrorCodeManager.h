//
//  MAErrorCodeManager.h
//  SongJiangMember
//
//  Created by YURI_JOU on 15-6-2.
//  Copyright (c) 2015年 SongJiang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MAErrorCodeManager : NSObject

@property (nonatomic, strong, readonly)NSDictionary *errorDescDic;

+ (instancetype)manager;

- (NSString *)errorDescWithCode:(NSInteger)code;

@end
