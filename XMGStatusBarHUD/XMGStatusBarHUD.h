//
//  XMGStatusBarHUD.h
//  XMGStatusBarHUD
//
//  Created by 蔡文宇(caiwenyu.china) on 16/3/4.
//  Copyright © 2016年 蔡文宇(caiwenyu.china). All rights reserved.
//  简单易用的状态栏指示器，提示：成功、失败、加载、普通消息、图片消息
//  A very simple and easy to use status bar indicator
//  can show: success\error\loading\common message\message with image

#import <UIKit/UIKit.h>

@interface XMGStatusBarHUD : NSObject
/** 显示成功信息 带图片 show success message with success image*/
+(void)showSuccess:(NSString *)msg;
/** 显示失败信息 带图片 show error message with error image*/
+(void)showError:(NSString *)msg;
/** 显示加载信息 无图片 show loading message with no image */
+(void)showLoading:(NSString *)msg;
/** 显示普通信息 无图片 show common message with no image*/
+(void)showMessage:(NSString *)msg;
/** 显示普通信息 带图片 show common message with image*/
+(void)showMessage:(NSString *)msg image:(UIImage *)img;
+(void)hide;
@end
