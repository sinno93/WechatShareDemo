//
//  ViewController.m
//  WechatShareDemo
//
//  Created by Sinno on 16/11/9.
//  Copyright © 2016年 Sinno. All rights reserved.
//

#import "ViewController.h"
#import "WXApi.h"
#import "WXApiObject.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)shareButtonClick:(id)sender {
    SendMessageToWXReq *req = [[SendMessageToWXReq alloc]init];
    req.bText = YES;           // 指定为发送文本
    req.text = @"hello world"; // 要发送的文本
    req.scene = WXSceneSession;// 指定发送到会话
    [WXApi sendReq:req];
}
-(void)sendText:(NSString*)text To:(enum WXScene)scene{
    if(![self checkIsWxInstalled]){
        return;
    }
    SendMessageToWXReq *req = [[SendMessageToWXReq alloc]init];
    req.bText = YES;
    req.text = @"hello world";
    req.scene = scene;
    [WXApi sendReq:req];
}
-(void)openWebView:(NSString*)url{
    OpenWebviewReq *webViewReq = [[OpenWebviewReq alloc]init];
    webViewReq.url = url;
    [WXApi sendReq:webViewReq];
}
-(BOOL)checkIsWxInstalled{
    BOOL isInstalled = [WXApi isWXAppInstalled];
    if (!isInstalled) {
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"您未安装微信" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *ensureButton = [UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleCancel handler:nil];
        [alertVC addAction:ensureButton];
        [self presentViewController:alertVC animated:YES completion:nil];
    }
    return isInstalled;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
