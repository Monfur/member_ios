//
//  SJMChcheManager.m
//  SongJiangMember
//
//  Created by 王泽剀 on 15/6/1.
//  Copyright (c) 2015年 SongJiang. All rights reserved.
//

#import "SJMChcheManager.h"

@implementation SJMChcheManager
static SJMChcheManager *instance;


+ (instancetype)prestoManager{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self.class alloc] init];
    });
    return instance;
}

- (void)prepareFileByFileName:(NSString *)fileName
        class:(Class)class completion:(void (^)(id))completion{
    if (nil == fileName) return ;
    self.filePath = [self generateFilePath:fileName];
    if([self updateFileFromServer]){
        
        [self prepareGet:class Url:self.fileURL completion:completion];
        
    }else{
                
        completion([self getModel:class]);
    }
    
    
}

-(void)prepareGet:(Class)class Url:(NSString*)url
                completion:(void (^)(id))completion{
    
    [[MAHttpClient client]get:[url urlPathComponents] class:[NSData class] completion:^(NSData *data){
        
        if(data){
            
            [self createFileByName:self.filePath fileData:data];
            if ([class isSubclassOfClass:[MAModel class]]) {
                id instance = [[SJMExampleModel alloc] initWithData:data];
                if (instance && completion) {
                    completion(instance);
                }
            }
        }
        
    }];
    
    
    
    
}


-(SJMExampleModel*)getModel:(Class)class{
    
    NSData *fileData = [[NSData alloc] initWithContentsOfFile:self.filePath];
    if ([class isSubclassOfClass:[MAModel class]] && fileData) {
        id instance = [[SJMExampleModel alloc] initWithData:fileData];
        
        if(instance) return instance;
    }

    
    return nil;
}


- (BOOL)updateFileFromServer{
    
    if ([self updateFileWithRateUnit] ) {
        
        return YES;
        
    }else{
        
        return  NO;
    }
}






@end
