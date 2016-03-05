# XMGStatusBarHUD
一个非常简单易用的状态栏指示器，A very simple and easy to use status bar indicator
## 显示成功信息 show success message with default image
```objc
[XMGStatusBarHUD showSuccess:@"loaded success"];
```
## 显示失败信息 show error message with default image
```objc
[XMGStatusBarHUD showError:@"loaded error"];
```
## 显示加载信息 show loading message with no image
```objc
[XMGStatusBarHUD showLoading:@"loading"];
```
## 显示普通信息 show common message with image
```objc
[XMGStatusBarHUD showMessage:@"hello world!" image:[UIImage imageNamed:@"check"]];
```
## 隐藏HUD hide HUD
```objc
[XMGStatusBarHUD hide];
```