//
//  SJMExampleModel.m
//  SongJiangMember
//
//  Created by YURI_JOU on 15-5-29.
//  Copyright (c) 2015年 SongJiang. All rights reserved.
//

#import "SJMExampleModel.h"

@implementation SJMExampleModel

+ (NSDictionary *)keyValueMapping{
  return @{
           
           @"users":@"data"
           
           };
}

+ (NSDictionary *)keysOfObject{
  return @{
           @"users":@"SJMExampleUserModel"
           };
}


@end
