//
//  MAColorManager.m
//  Overseas
//
//  Created by YURI_JOU on 15-3-5.
//

#import "MAColorManager.h"

#define DEFAULT_BUNDLE                    @"MumaDefault"
#define DEFAULT_FORE_COLOR                @"default_fore_color"
#define DEFAULT_BACK_COLOR                @"default_back_color"
#define DEFAULT_BUTTON_LIGHT_COLOR        @"default_button_light_color"
#define DEFAULT_BUTTON_DARK_COLOR         @"default_button_dark_color"
#define DEFAULT_LINE_STROKED_COLOR        @"default_line_stroked_color"

@interface MAColorManager()

@property (nonatomic, strong) NSString *bundleName;
@property (nonatomic, strong) NSDictionary *colorTags;

@end

@implementation MAColorManager

static MAColorManager *sharedInstance;

+ (instancetype) sharedManager{
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    sharedInstance = [[self.class alloc] init];
  });
  return sharedInstance;
}

- (instancetype) init{
  return [self initWithBundleName:nil];
}

- (instancetype)initWithBundleName:(NSString *)bundleName{
  self = [super init];
  if(self){
    self.bundleName = bundleName;
  }
  return self;
}

#pragma mark - accessor
- (void) setBundleName:(NSString *)bundleName{
  _bundleName = _bundleName != nil ? _bundleName : DEFAULT_BUNDLE;
  NSBundle *bundle = [[MABundleManager manager] bundleWithName:_bundleName];
  self.colorTags = [bundle getValuesFromPlist:@"config" key:@"Color"];
}

#pragma mark -private method
- (UIColor *)defaultForeColor{
  return [self colorWithTag:DEFAULT_FORE_COLOR];
}

- (UIColor *)defaultBackgroundColor{
  return [self colorWithTag:DEFAULT_BACK_COLOR];
}

- (UIColor *)defaultLightColor{
  return [self colorWithTag:DEFAULT_BUTTON_LIGHT_COLOR];
}

- (UIColor *)defaultDarkColor{
  return [self colorWithTag:DEFAULT_BUTTON_DARK_COLOR];
}

- (UIColor *)defaultLineStrokedColor{
  return [self colorWithTag:DEFAULT_LINE_STROKED_COLOR];
}

- (UIColor *)colorWithTag:(id)tag{
  id color = self.colorTags[tag];
  if ([color isKindOfClass:[NSNumber class]]) {
    return [UIColor colorWithHex:[(NSNumber *)color integerValue]];
  }else if([color isKindOfClass:[NSString class]]){
    return [UIColor colorWithHexString:(NSString *)color];
  }
  return nil;
}

@end
