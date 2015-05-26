//
//  UIImageView+Extra.m
//  Overseas
//
//  Created by YURI_JOU on 15-3-10.
//

#import "UIImageView+Extra.h"

@implementation UIImageView (Extra)

- (void)setImageWithURLText:(NSString *)urlText placeholderImage:(UIImage *)placeholder{
  NSURL *url = [NSURL URLWithString:[urlText stringByDeletingWhiteSpace]];
  [self sd_setImageWithURL:url placeholderImage:placeholder];
}

@end
