//
//  ViewController.m
//  指纹识别
//
//  Created by 张锋 on 16/5/22.
//  Copyright © 2016年 张锋. All rights reserved.
//


#import "ViewController.h"
#import "ZFTouchID.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /**
     test无精打采 github
     
     - returns: <#return value description#>
     */
    ZFTouchID *touchID = [[ZFTouchID alloc] init];
    [touchID TouchIDWithDetail:@"可以在这里设置自定义信息" Block:^(BOOL success, kErrorType type, NSError *error) {
        if (success) {
            // 识别成功
            NSLog(@"识别成功");
        }else {
            // 识别失败
            NSLog(@"识别失败");
            // 如果验证失败，需要在这里判断各种不同的情况已进行不同的处理
            switch (type) {
                case kErrorTypeAuthenticationFailed:
                    NSLog(@"kErrorTypeAuthenticationFailed");
                    break;
                case kErrorTypeUserCancel:
                    NSLog(@"kErrorTypeUserCancel");
                    break;
                case kErrorTypeUserFallback:
                    NSLog(@"kErrorTypeUserFallback");
                    break;
                    // ...
                default:
                    break;
            }
        }
    }];
}

@end
