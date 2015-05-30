//
//  SJMExampleModel.h
//  SongJiangMember
//
//  Created by YURI_JOU on 15-5-29.
//  Copyright (c) 2015年 SongJiang. All rights reserved.
//

#import "MAModel.h"

@interface SJMExampleModel : MAModel

@property (nonatomic, assign)NSInteger code;
@property (nonatomic, strong)NSString *msg;

@property (nonatomic, strong)NSArray *users;

@end
