//
//  HRLHiFiHybridWebViewController.m
//  HiFiHybridizationDemo
//
//  Created by Tokuya HIRAIZUMI on 2014/12/21.
//  Copyright (c) 2014年 Tokuya HIRAIZUMI. All rights reserved.
//

#import "HRLHiFiHybridWebViewController.h"

@interface HRLHiFiHybridWebViewController ()

@end

@implementation HRLHiFiHybridWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_webView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
