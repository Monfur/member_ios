//
//  ViewController.m
//  SongJiangMember
//
//  Created by YURI_JOU on 15-5-25.
//  Copyright (c) 2015年 SongJiang. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self test];
    
    
    
  // Do any additional setup after loading the view, typically from a nib.
}


-(void)test{
    
    UIEdgeInsets padding = UIEdgeInsetsMake(10, 10, 300, 10);
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        
        //make.edges.equalTo(self.view).with.insets(padding);
       // make
        
    }];
    
    [self performSelector:@selector(click:) withObject:view afterDelay:1.0];
   // [self remark:view];
    
}

-(void)click:(UIView*)view{
    
    
    [self remark:view];
    
    
}


-(void)remark:(UIView*)view{
    
    [view mas_remakeConstraints:^(MASConstraintMaker *make) {
        
        //make.size.equalTo(self.view);
        
       
            make.top.and.left.offset(10);
        
            make.bottom.and.right.offset(-10);
        
    }];
    
    
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
