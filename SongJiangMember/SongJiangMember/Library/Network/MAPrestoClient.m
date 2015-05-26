//
//  MAPrestoClient.m
//  Overseas
//
//  Created by YURI_JOU on 15-3-9.
//

#import "MAPrestoClient.h"
#import "NSDictionary+MAPrestoClient.h"

@interface MAPrestoClient()



@end

@implementation MAPrestoClient
static MAPrestoClient *instance;

+ (instancetype)prestoClient{
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[self.class alloc] init];
  });
  return instance;
}


- (void)example:(void (^)(id))completion{
  NSDictionary *params = @{
                           @"example":@0,
                           } ;
  [[MAHttpClient client]get:[@"example/example" urlPathComponents]
                     params:[params presto]
                      class:[MAModel class]
                 completion:completion];
}



@end
