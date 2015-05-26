//
//  MANavigationController.m
//  Overseas
//
//  Created by YURI_JOU on 15-3-5.
//

#import "MANavigationController.h"

@implementation MANavigationController

- (void)viewDidLoad{
  self.navigationBar.barTintColor = [[MAColorManager sharedManager] defaultForeColor];
  self.navigationBar.translucent = NO;
  [super viewDidLoad];
}

@end
