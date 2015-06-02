//
//  SJMChche.h
//  SongJiangMember
//
//  Created by 王泽剀 on 15/6/1.
//  Copyright (c) 2015年 SongJiang. All rights reserved.
//

#import <Foundation/Foundation.h>
// 文件更新频率
typedef enum {
    UPDATE_NEVER,               // 从不更新
    UPDATE_RATEUNIT_ONCE,       // 只更新一次
    UPDATE_RATEUNIT_EVERY,     // 每次更新
    UPDATE_RATEUNIT_DAY,        // 每天更新
    UPDATE_RATEUNIT_THREEDAY,   // 每三天更新
    UPDATE_RATEUNIT_WEEK,       // 每周更新
    UPDATE_RATEUNIT_MONTH       // 每月更新
}FileUpdateRateUnit;

@interface SJMChche : NSObject


// 文件夹名称
@property (strong, nonatomic) NSString *folderName;
// 文件名称
@property (strong, nonatomic) NSString *fileName;
// 文件全路径
@property (strong, nonatomic) NSString *filePath;
// 更新频率
@property (nonatomic) FileUpdateRateUnit updateRateUnit;
// 更新文件的URL
@property (strong, nonatomic) NSString *fileURL;
// 文件名是否需要MD5加密
@property (nonatomic) BOOL fileNameNeedMD5Flag;


// 生成文件夹全路径
- (NSString *)generateFolderPath;
// 创建文件夹
- (void)createFolder;
// 生成文件全路径
- (NSString *)generateFilePath:(NSString *)fileName;
// 判断文件是否存在
- (BOOL)fileExistsAtPath:(NSString *)path;
// 创建文件
- (BOOL)createFileByName:(NSString *)fileName fileData:(NSData *)data;
// 删除文件
- (void)deleteFileByName:(NSString *)path;
// 文件至今多少天
- (NSInteger)dateEarlierNow:(NSString *)fileName;
// MD5加密
//- (NSString *)md5HexDigest:(NSString *)fileName;

///////////////////////////////////////////
// 文件更新策略方法
- (BOOL)updateFileWithRateUnit;




@end
