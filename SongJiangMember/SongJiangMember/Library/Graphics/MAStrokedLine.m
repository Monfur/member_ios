//
//  MAStrokedLine.m
//  Overseas
//
//  Created by YURI_JOU on 15-3-12.
//

#import "MAStrokedLine.h"

@implementation MAStrokedLine

- (instancetype)initWithColor:(UIColor *)color width:(CGFloat)width{
  self = [super initWithFrame:CGRectZero];
  if (self) {
    self.color = color;
    self.width = width;
    self.backgroundColor = [UIColor clearColor];
  }
  return self;
}

- (void)setColor:(UIColor *)color{
  _color = color;
  [self setNeedsDisplay];
}

- (void)setWidth:(CGFloat)width{
  _width = width;
  [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect{
  CGContextRef context = UIGraphicsGetCurrentContext();
  CGContextSetStrokeColorWithColor(context, self.color.CGColor);
  
  CGFloat pointX = (self.bounds.size.height > self.bounds.size.width) ? self.bounds.size.width : 0;
  CGFloat pointY = (self.bounds.size.height > self.bounds.size.width) ? 0 :self.bounds.size.height;
  
  CGContextSetLineWidth(context, self.width);
  CGContextMoveToPoint(context, pointX, pointY); //start at this point
  CGContextAddLineToPoint(context, self.bounds.size.width, self.bounds.size.height); //draw to this point
  // and now draw the Path!
  CGContextStrokePath(context);
}

@end
