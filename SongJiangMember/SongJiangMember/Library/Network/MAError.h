//
//  MAError.h
//  Overseas
//
//  Created by YURI_JOU on 15-3-9.
//

#import <Foundation/Foundation.h>

@interface MAError : NSObject

@property (nonatomic, strong) AFHTTPRequestOperation *operation;
@property (nonatomic, strong) NSError *error;

@end
