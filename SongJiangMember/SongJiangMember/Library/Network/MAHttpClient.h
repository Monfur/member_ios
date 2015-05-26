//
//  MAHttpClient.h
//  Overseas
//
//  Created by YURI_JOU on 15-3-9.
//

#import <Foundation/Foundation.h>

@interface MAHttpClient : NSObject

@property (nonatomic, strong, readonly) NSString *baseUrl;

+ (instancetype) client;

- (BOOL)isReachable;
- (void)cancelOperations;
- (void)setActivityIndicatorVisible:(BOOL)visible;

- (void)reset;
- (void)setAPI:(NSString *)api;
- (void)setHostUrl:(NSString *)url;
- (void)cancelAllOperation;

// get
- (void)get:(NSString *) url;
- (void)get:(NSString *) url completion:(void(^)(id)) completion;
- (void)get:(NSString *) url class:(Class) class completion:(void(^)(id)) completion;
- (void)get:(NSString *) url params:(NSDictionary *)params class:(Class) class completion:(void(^)(id)) completion;
- (void)get:(NSString *) url params:(NSDictionary *)params class:(Class) class completion:(void(^)(id)) completion error:(void (^)(MAError *)) error;

// post
- (void)post:(NSString *) url;
- (void)post:(NSString *) url completion:(void(^)(id)) completion;
- (void)post:(NSString *) url class:(Class) class completion:(void(^)(id)) completion;
- (void)post:(NSString *) url params:(NSDictionary *)params class:(Class) class completion:(void(^)(id)) completion;
- (void)post:(NSString *) url params:(NSDictionary *)params class:(Class) class completion:(void(^)(id)) completion error:(void (^)(MAError *)) error;

@end
