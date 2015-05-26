//
//  MAViewController.m
//  Overseas
//
//  Created by YURI_JOU on 15-2-10.
//

#import "MAViewController.h"

@interface MAViewController ()

@end

@implementation MAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  self.view.backgroundColor = [[MAColorManager sharedManager] defaultBackgroundColor];
  self.edgesForExtendedLayout = UIRectEdgeNone;
  self.extendedLayoutIncludesOpaqueBars = YES;
  self.automaticallyAdjustsScrollViewInsets = NO;
}

@end
