//
//  MAModel.m
//  Overseas
//
//  Created by YURI_JOU on 15-3-7.
//

#import "MAModel.h"
#import <objc/runtime.h>

@implementation MAModel

MTLValueTransformer* dateWithIntegerIMP(id self, SEL _cmd){
  return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSNumber *dateNum) {
    return [NSDate dateWithTimeIntervalSince1970:dateNum.floatValue];
  } reverseBlock:^(NSDate *date) {
    return [NSString stringWithFormat:@"%f",[date timeIntervalSince1970]];
  }];
}

MTLValueTransformer* dateWithFormateIMP(id self, SEL _cmd){
  return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *dateStr) {
    return [NSDate dateWithString:dateStr formatterString:@"yyyy-MM-dd HH:mm:ss"];
  } reverseBlock:^(NSDate *date) {
    return [NSString stringWithFormat:@"%f",[date timeIntervalSince1970]];
  }];
}

MTLValueTransformer* dateWithCustomFormateIMP(id self, SEL _cmd){
  return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *dateStr) {
    NSString *joinName = NSStringFromSelector(_cmd);
    NSRange range = [joinName rangeOfString:@"JSONTransformer"];
    NSString *key = [joinName substringWithRange:NSMakeRange(0, range.location)];
    NSString *formate = [[(MAModel *)self class] keysOfDateWithCustomFormate][key];
    return [NSDate dateWithString:dateStr formatterString:formate];
  } reverseBlock:^(NSDate *date) {
    return [NSString stringWithFormat:@"%f",[date timeIntervalSince1970]];
  }];
}

MTLValueTransformer* dateWithArrayIMP(id self, SEL _cmd){
  return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSArray *objectArray) {
    NSString *joinName = NSStringFromSelector(_cmd);
    NSRange range = [joinName rangeOfString:@"JSONTransformer"];
    NSString *key = [joinName substringWithRange:NSMakeRange(0, range.location)];
    NSString *className = [[(MAModel *)self class] keysOfArray][key];
    Class objectClass = NSClassFromString(className);
    NSMutableArray *transferedArr = [NSMutableArray array];
    for(id object in objectArray){
      if ([object isKindOfClass:[NSDictionary class]]) {
        id ob = [[objectClass alloc] initWithDictionary:object];
        if (ob) {
          [transferedArr addObject:ob];
        }
      }
    }
    return transferedArr;
  } reverseBlock:^(NSDate *date) {
    return [NSString stringWithFormat:@"%f",[date timeIntervalSince1970]];
  }];
}

MTLValueTransformer* dateWithObjectIMP(id self, SEL _cmd){
  return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSDictionary *objectDictionary) {
    NSString *joinName = NSStringFromSelector(_cmd);
    NSRange range = [joinName rangeOfString:@"JSONTransformer"];
    NSString *key = [joinName substringWithRange:NSMakeRange(0, range.location)];
    NSString *className = [[(MAModel *)self class] keysOfObject][key];
    Class objectClass = NSClassFromString(className);
    id object = nil;
    if ([objectDictionary isKindOfClass:[NSDictionary class]]) {
      object = [[objectClass alloc] initWithDictionary:objectDictionary];
    }
    return object;
  } reverseBlock:^(NSDate *date) {
    return [NSString stringWithFormat:@"%f",[date timeIntervalSince1970]];
  }];
}

+ (void) initialize{
  [super initialize];
  [self.class ma_resolveMethods];
}

#pragma clang diagnostic ignored "-Wdeprecated-declarations"
- (instancetype) initWithDictionary:(NSDictionary *)dictionary{
  NSError *error = nil;
  self = [MTLJSONAdapter modelOfClass:[self class] fromJSONDictionary:dictionary];
  if (error) {
    return nil;
  }
  return self;
}

#pragma clang diagnostic ignored "-Wdeprecated-declarations"
- (instancetype) initWithData:(NSData *)jsonData{
  NSError *error = nil;
  NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&error];
  if(error){
    return nil;
  }
  return [self initWithDictionary:dict];
}

- (instancetype) initWithString:(NSString *)jsonStr{
  if (!jsonStr || [jsonStr length] <= 0) {
    return nil;
  }
  
  NSError *error = nil;
  NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:[jsonStr dataUsingEncoding:NSUTF8StringEncoding]
                                                  options:kNilOptions
                                                    error:&error];
  if (error || !dict) {
    return nil;
  }
  self = [self initWithDictionary:dict];
  return self;
}

+ (id)objectWithData:(NSData *)jsonData{
  return [[[self class] alloc] initWithData:jsonData];
}

+ (id)objectWithString:(NSString *)jsonStr{
  return [[[self class] alloc] initWithString:jsonStr];
}

+ (id)objectWithDictionary:(NSDictionary *)dictionary{
  return [[[self class] alloc] initWithDictionary:dictionary];
}

+ (NSDictionary *)keyValueMapping{
  return nil;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey{
  return [[self class] keyValueMapping];
}

+ (NSArray *)keysOfDateWithInteger{
  return nil;
}

+ (NSArray *)keysOfDateWithFormate{
  return nil;
}

+ (NSDictionary *)keysOfDateWithCustomFormate{
  return nil;
}

+ (NSDictionary *)keysOfArray{
  return nil;
}

+ (NSDictionary *)keysOfObject{
  return nil;
}

+ (void) ma_resolveMethods{
  
  [self.class ma_resolveMethods:[self.class keysOfDateWithInteger]
                            imp:(IMP)dateWithIntegerIMP];
  
  [self.class ma_resolveMethods:[self.class keysOfDateWithFormate]
                            imp:(IMP)dateWithFormateIMP];
  
  [self.class ma_resolveMethods:[self.class keysOfDateWithCustomFormate].allKeys
                            imp:(IMP)dateWithCustomFormateIMP];
  
  [self.class ma_resolveMethods:[self.class keysOfArray].allKeys
                            imp:(IMP)dateWithArrayIMP];
  
  [self.class ma_resolveMethods:[self.class keysOfObject].allKeys
                            imp:(IMP)dateWithObjectIMP];

}

+ (void) ma_resolveMethods:(NSArray *)methods imp:(IMP) methodIMP{
  for(id m in methods){
    if ([m isKindOfClass:[NSString class]]) {
      NSString *name = [NSString stringWithFormat:@"%@JSONTransformer",m];
      SEL selector = NSSelectorFromString(name);
      Class metaClass = object_getClass([self class]);
      class_addMethod(metaClass, selector, methodIMP, "@@:");
    }
  }
}


//To cache model
//set the property of "cacheId" as identifier first

- (void)cache{
  
  if(![self valueForKey:@"cacheId"]){
    return;
  }
  NSString *cachedName = [NSString stringWithFormat:@"%@_%@",
                          NSStringFromClass(self.class),
                          [self valueForKey:@"cacheId"]];
  
  NSString *cachedPath = [[MAFileManager manager].cacheHostPath
                          stringByAppendingPathComponent:cachedName];
  
  [self.dictionaryValue writeToFile:cachedPath atomically:YES];
  
}


@end
