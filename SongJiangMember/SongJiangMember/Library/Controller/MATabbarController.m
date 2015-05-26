//
//  MATabbarController.m
//  Overseas
//
//  Created by YURI_JOU on 15-3-5.
//

#import "MATabbarController.h"

@implementation MATabbarController

- (void)viewDidLoad{
  [super viewDidLoad];
  self.tabBar.translucent = NO;
  self.view.backgroundColor = [MAColorManager sharedManager].defaultBackgroundColor;
}

@end
