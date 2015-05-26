//
//  MACameraController.h
//  Overseas
//
//  Created by YURI_JOU on 15-4-2.
//

#import "MAViewController.h"

@interface MACameraController : MAViewController

@property (nonatomic, copy) void(^cancelBlock)(UIViewController *controller);

@end
