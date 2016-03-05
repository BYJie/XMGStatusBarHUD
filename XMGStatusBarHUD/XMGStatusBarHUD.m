//
//  XMGStatusBarHUD.h
//  XMGStatusBarHUD
//
//  Created by 蔡文宇(caiwenyu.china) on 16/3/4.
//  Copyright © 2016年 蔡文宇(caiwenyu.china). All rights reserved.
//  简单易用的状态栏指示器，提示：成功、失败、加载、普通消息、图片消息
//  A very simple and easy to use status bar indicator
//  can show: success\error\loading\common message\message with image
#import "XMGStatusBarHUD.h"

#define XMGMessageFont [UIFont systemFontOfSize:12]
/**message hold time*/
static CGFloat const XMGMessageDuration = 2.0;
/**message show\hiden time*/
static CGFloat const XMGAnimationDuration = .25;
/**global window*/
static UIWindow *window_;
/**global timer*/
static NSTimer *timer_;


@implementation XMGStatusBarHUD


#pragma mark 成功 show success
+(void)showSuccess:(NSString *)msg{
    [self showMessage:msg image:[UIImage imageNamed:@"XMGStatusBarHUD.bundle/success"]];
}

#pragma mark 失败 show error
+(void)showError:(NSString *)msg{
    [self showMessage:msg image:[UIImage imageNamed:@"XMGStatusBarHUD.bundle/error"]];
    
}

#pragma mark loading show loading
+(void)showLoading:(NSString *)msg{
    
    //dispose timer
    [timer_ invalidate];
    timer_ = nil;
    
    [self setupWindow];
    UILabel *label = [[UILabel alloc] init];
    label.font = XMGMessageFont;
    label.frame = window_.bounds;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = msg;
    label.textColor = [UIColor whiteColor];
    [window_ addSubview:label];
    
    //add loading image
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];
    [window_ addSubview: loadingView];
    
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName : XMGMessageFont}].width;
    CGFloat margin = 10;
    CGFloat totalW = msgW + loadingView.frame.size.width + margin;
    CGFloat left = (window_.frame.size.width - totalW) * 0.5 ;
    CGFloat right = left + totalW;
    
    loadingView.center = CGPointMake(left + loadingView.frame.size.width * 0.5, window_.frame.size.height * 0.5);
    
    CGRect lblFrame = label.frame;
    CGRect newFrame = CGRectMake(right - msgW, lblFrame.origin.y, msgW, lblFrame.size.height);
    label.frame = newFrame;
    
}
#pragma mark 显示普通信息 show common message with no image
+(void)showMessage:(NSString *)msg{
    [self showMessage:msg image:nil];
}
#pragma mark 显示普通信息 show common message with image
+(void)showMessage:(NSString *)msg image:(UIImage *)img{
    
    //stop timer
    [timer_ invalidate];
    
    [self setupWindow];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [window_ addSubview:btn];
    [btn setTitle:msg forState:UIControlStateNormal];
    [btn.titleLabel setFont:XMGMessageFont];

    if (img) {
        btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [btn setImage:img forState:UIControlStateNormal];
    }
    
    btn.frame = window_.bounds;
    
    //start timer
    timer_ = [NSTimer scheduledTimerWithTimeInterval:XMGMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
}

#pragma mark init window
+(void)setupWindow{
    
    //Primitive frame with window
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, - windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    
    window_.hidden = YES;
    window_ = [[UIWindow alloc] init];
    window_.windowLevel = UIWindowLevelAlert;
    window_.frame = frame;
    window_.hidden = NO;
    
    //Final frame with window
    frame.origin.y = 0;
    [UIView animateWithDuration:XMGAnimationDuration animations:^{
        window_.frame = frame;
    }];
}
#pragma mark 隐藏 hide window
+(void)hide{
    
    [UIView animateWithDuration:XMGAnimationDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y = - frame.size.height;
        window_.frame = frame;
        
    } completion:^(BOOL finished) {
        window_ = nil;
        timer_ = nil;
    }];
    

}
@end
