//
//  SJMChche.m
//  SongJiangMember
//
//  Created by 王泽剀 on 15/6/1.
//  Copyright (c) 2015年 SongJiang. All rights reserved.
//

#import "SJMChche.h"

@implementation SJMChche

- (id)init{
    if (self = [super init]) {
        _updateRateUnit = UPDATE_NEVER;
        _fileNameNeedMD5Flag = NO;
    }
    
    return self;
}

- (NSString *)generateFolderPath{
    return [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:_folderName];
}


- (void)createFolder{
    if (NO == [self fileExistsAtPath:[self generateFolderPath]]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:[self generateFolderPath] withIntermediateDirectories:YES attributes:nil error:NULL];
    }
}

- (NSString *)generateFilePath:(NSString *)fileName{
    if (nil == fileName) return nil;
    
    [self createFolder];
    if (_fileNameNeedMD5Flag) {
        //self.fileName = [self md5HexDigest:fileName];
    }else{
        self.fileName = fileName;
    }
    
    self.filePath = [[self generateFolderPath] stringByAppendingPathComponent:_fileName];
    return _filePath;
}


- (BOOL)fileExistsAtPath:(NSString *)path{
    if (nil == path) return NO;
    return [[NSFileManager defaultManager] fileExistsAtPath:path];
}


- (BOOL)createFileByName:(NSString *)fileName fileData:(NSData *)data;{
    if (nil == data || nil == fileName) return NO;

    [self deleteFileByName:fileName];
    BOOL flag = [[NSFileManager defaultManager] createFileAtPath:fileName
                                                        contents:data
                                                      attributes:nil];
    return flag;
}


- (void)deleteFileByName:(NSString *)path{
    if ([self fileExistsAtPath:_filePath]) {
        NSError *error;
        [[NSFileManager defaultManager] removeItemAtPath:_filePath error:&error];
    }
}


- (NSInteger)dateEarlierNow:(NSString *)fileName{
    if (nil == fileName) return 0;
    if ([self fileExistsAtPath:fileName] == NO) return 0;
    
    NSDictionary * fileAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:fileName error:nil];
    if (fileAttributes) {
        NSDate *createDate = (NSDate *)[fileAttributes objectForKey:NSFileCreationDate];
        if (nil == createDate) return 0;
        
        //获取系统当前时间
        NSDate *today = [NSDate date];
        NSTimeInterval interVal = [today timeIntervalSinceDate:createDate];
        //转换为天数
        NSInteger days     = (NSInteger)((int)interVal / 86400);
        return days;
    }else{
        return 0;
    }
}

// MD5加密
//- (NSString *)md5HexDigest:(NSString *)fileName{
//    if (nil == fileName) return nil;
//    
//    const char *original_str = [fileName UTF8String];
//    unsigned char result[CC_MD5_DIGEST_LENGTH];
//    CC_MD5(original_str, strlen(original_str), result);
//    NSMutableString *hash = [NSMutableString string];
//    for (int i = 0; i < 16; i++)
//        [hash appendFormat:@"%02X", result[i]];
//    return [hash lowercaseString];
//}

- (BOOL)updateFileWithRateUnit{
    
    if (UPDATE_NEVER == _updateRateUnit) return NO;
    
    
    if (NO == [self fileExistsAtPath:_filePath]) return YES;
    
    if (UPDATE_RATEUNIT_ONCE == _updateRateUnit) return NO;
    
    
    if (UPDATE_RATEUNIT_EVERY == _updateRateUnit) return YES;
    
    NSInteger days = [self dateEarlierNow:_filePath];
    if (UPDATE_RATEUNIT_DAY == _updateRateUnit && days >= 1) return YES;
    if (UPDATE_RATEUNIT_THREEDAY == _updateRateUnit && days >= 3) return YES;
    if (UPDATE_RATEUNIT_WEEK == _updateRateUnit && days >= 7) return YES;
    if (UPDATE_RATEUNIT_MONTH == _updateRateUnit && days >= 30) return YES;
    
    return NO;
}









@end
