//
//  ViewController.m
//  XMGStatusBarHUD
//
//  Created by 蔡文宇 on 16/3/4.
//  Copyright © 2016年 蔡文宇. All rights reserved.
//  版本号 1.2.3 5.6.9 1.10.23 大版本号.功能更新版本号.BUG修复版本号

#import "ViewController.h"
#import "XMGStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)success:(id)sender {
    [XMGStatusBarHUD showSuccess:@"加载成功"];
}

- (IBAction)error:(id)sender {
    [XMGStatusBarHUD showError:@"加载失败"];
}

- (IBAction)loading:(id)sender {
    [XMGStatusBarHUD showLoading:@"加载之中"];
}
- (IBAction)message:(id)sender {
    [XMGStatusBarHUD showMessage:@"今天天气挺好的" image:[UIImage imageNamed:@"check"]];
}

- (IBAction)hide:(id)sender {
    [XMGStatusBarHUD hide];
}

@end
