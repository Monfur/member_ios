//
//  MAHttpClient.m
//  Overseas
//
//  Created by YURI_JOU on 15-3-9.
//

#import "MAHttpClient.h"
#import <AFNetworking/AFNetworkActivityIndicatorManager.h>

#ifdef __SJM_MODE_DEBUG__

//@debug
#define MA_HTTP_CLIENT_HOST_URL @"http://192.168.1.117"
#define MA_HTTP_CLIENT_API @"/json/api"

#else

//@release
#define MA_HTTP_CLIENT_HOST_URL @"https://52songjiang.com"
#define MA_HTTP_CLIENT_API @"/api/v1"

#endif



@interface MAHttpClient(){
  NSString *_baseUrl;
}

@property (nonatomic, strong) NSString *baseUrl;
@property (nonatomic, strong) NSString *host;
@property (nonatomic, strong) NSString *api;
@property (nonatomic, strong) AFHTTPRequestOperationManager *manager;

@end


@implementation MAHttpClient
static MAHttpClient *instance;

#pragma mark - accessor
- (AFHTTPRequestOperationManager *) manager{
  if (!_manager) {
    [self setActivityIndicatorVisible:YES];
    _manager = [AFHTTPRequestOperationManager manager];
    _manager.requestSerializer.timeoutInterval = 1;//time out limit 30s
  }
  return [AFHTTPRequestOperationManager manager];
}

- (void)setActivityIndicatorVisible:(BOOL)visible{
  AFNetworkActivityIndicatorManager *manager = [AFNetworkActivityIndicatorManager sharedManager];
  [manager setEnabled:visible];
}

- (BOOL)isReachable{
  AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager managerForAddress:[self.baseUrl UTF8String]];
  return manager.reachable;
}

- (void)cancelOperations{
  [self.manager.operationQueue cancelAllOperations];

}

+ (instancetype) client{
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[MAHttpClient alloc] init];
  });
  return instance;
}

- (NSString *)baseUrl{
  if (!_baseUrl) {
    _baseUrl = [NSString stringWithFormat:@"%@%@",self.host,self.api];
  }
  return _baseUrl;
}

- (NSString *)api{
  if (!_api) {
    _api = MA_HTTP_CLIENT_API;
  }
  return _api;
}

- (NSString *)host{
  if (!_host) {
    _host = MA_HTTP_CLIENT_HOST_URL;
  }
  return _host;
}

- (void)reset{
  self.baseUrl = [NSString stringWithFormat:@"%@%@",MA_HTTP_CLIENT_HOST_URL,MA_HTTP_CLIENT_API];
}
- (void)setAPI:(NSString *)api{
  self.baseUrl = [NSString stringWithFormat:@"%@%@",self.host,api];
}
- (void)setHostUrl:(NSString *)url{
  self.baseUrl = [NSString stringWithFormat:@"%@%@",url,self.api];
}

#pragma mark - cancal all operation

- (void)cancelAllOperation{
  [self.manager.operationQueue cancelAllOperations];
}

#pragma mark - get
- (void)get:(NSString *) url{
  [self get:url completion:nil];
}
- (void)get:(NSString *) url completion:(void(^)(id)) completion{
  [self get:url class:nil completion:completion];
}

- (void) get:(NSString *)url class:(Class)class completion:(void (^)(id))completion{
  [self get:url params:nil class:class completion:completion];
}

- (void) get:(NSString *)url params:(NSDictionary *)params class:(Class)class completion:(void (^)(id))completion{
  [self get:url params:params class:class completion:completion error:nil];
}

- (void)get:(NSString *)url params:(NSDictionary *)params class:(Class)class completion:(void (^)(id))completion
      error:(void (^)(MAError *)) error{
  
  NSString *getUrl = [NSString stringWithFormat:@"%@%@",self.baseUrl,url];
  [self.manager GET:getUrl parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
    if ([class isSubclassOfClass:[MAModel class]]) {
      id instance = [[class alloc] initWithData:operation.responseData];
      if (instance && completion) {
        completion(instance);
      }
    }else{
      
        completion(operation.responseData);
    }
      
  } failure:^(AFHTTPRequestOperation *operation, NSError *httpError) {
      
    if (error) {
      MAError *maError = [[MAError alloc] init];
      maError.operation = operation;
      maError.error = httpError;
      error(maError);
      if (completion) {
        id instance = [[class alloc]init];
        if ([class isSubclassOfClass:[MAModel class]]) {
          [(MAModel *)instance setError:maError];
        }
      }
    }
  }];
}

#pragma mark - post
- (void)post:(NSString *) url{
  [self post:url completion:nil];
}

- (void)post:(NSString *) url completion:(void(^)(id)) completion{
  [self post:url class:nil completion:completion];
}

- (void)post:(NSString *)url class:(Class)class completion:(void (^)(id))completion{
  [self post:url params:nil class:class completion:completion];
}

- (void)post:(NSString *)url params:(NSDictionary *)params class:(Class)class completion:(void (^)(id))completion{
  [self post:url params:params class:class completion:completion error:nil];
}

- (void)post:(NSString *)url params:(NSDictionary *)params class:(Class)class completion:(void (^)(id))completion error:(void (^)(MAError *))error{
  
  NSString *postUrl = [NSString stringWithFormat:@"%@%@",self.baseUrl,url];
  [self.manager POST:postUrl parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
    if ([class isSubclassOfClass:[MAModel class]]) {
      id instance = [[class alloc] initWithData:operation.responseData];
      if (instance && completion) {
        completion(instance);
      }
    }
  } failure:^(AFHTTPRequestOperation *operation, NSError *httpError) {
    if (error) {
      MAError *maError = [[MAError alloc] init];
      maError.operation = operation;
      maError.error = httpError;
      error(maError);
      if (completion) {
        id instance = [[class alloc]init];
        if ([class isSubclassOfClass:[MAModel class]]) {
          [(MAModel *)instance setError:maError];
        }
      }
    }
  }];
}

@end
