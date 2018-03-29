//
//  ViewController.m
//  YunoDemo
//
//  Created by Sole on 2018/3/20.
//  Copyright © 2018年 sole(sole.he@sophonspace.com). All rights reserved.
//

#import "ViewController.h"
#import <XBleSDK/XBLEUtils.h>


@interface ViewController ()
<
    XBLEUtilsDelagate
>


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[XBLEUtils share] setDelegate:self];
    
}


- (void)systemBleStateChanged:(XBLEState)state {
    NSLog(@"当前系统蓝牙状态：%zd", state);
    
    if (state == XBLEStatePoweredOn) {
        [[XBLEUtils share] scan:10.f result:^(XBLEDevice *device) {
            NSLog(@"扫描到设备：%@", device.mac);
        } compelete:^(BOOL timeout) {
            
        }];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
