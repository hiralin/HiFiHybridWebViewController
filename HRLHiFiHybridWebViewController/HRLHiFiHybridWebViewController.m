//
//  HRLHiFiHybridWebViewController.m
//  HiFiHybridizationDemo
//
//  Created by Tokuya HIRAIZUMI on 2014/12/21.
//  Copyright (c) 2014年 Tokuya HIRAIZUMI. All rights reserved.
//

#import "HRLHiFiHybridWebViewController.h"
#import <NJKWebViewProgress/NJKWebViewProgressView.h>
#import <SVProgressHUD/SVProgressHUD.h>

@interface HRLHiFiHybridWebViewController ()

@property (nonatomic, copy)     NSString *urlString;

@end

@implementation HRLHiFiHybridWebViewController
{
    NJKWebViewProgress *_progressProxy;
    NJKWebViewProgressView *_progressView;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
                      urlString:(NSString *)urlString
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.urlString          = urlString;
        
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _progressProxy = [[NJKWebViewProgress alloc] init];
    _webView.delegate = _progressProxy;
    _progressProxy.webViewProxyDelegate = self;
    _progressProxy.progressDelegate = self;
    
    // webview creation
    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_webView];

    // njkwebviewprogressview creation
    CGFloat progressBarHeight = 2.0;
    CGRect navigaitonBarBounds = self.navigationController.navigationBar.bounds;
    CGRect barFrame = CGRectMake(0, navigaitonBarBounds.size.height - progressBarHeight, navigaitonBarBounds.size.width, progressBarHeight);
    _progressView = [[NJKWebViewProgressView alloc] initWithFrame:barFrame];
    _progressView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
    
    // startLoading
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar addSubview:_progressView];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

    // Remove progress view
    // because UINavigationBar is shared with other ViewControllers
    [_progressView removeFromSuperview];
}

#pragma mark -
#pragma mark UIWebViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if (navigationType == UIWebViewNavigationTypeLinkClicked) {
        
        HRLHiFiHybridWebViewController *nextWebViewController = [[HRLHiFiHybridWebViewController alloc] initWithNibName:nil bundle:nil urlString:request.URL.absoluteString];
        
        [self.navigationController pushViewController:nextWebViewController animated:YES];
        
        return NO;
    }
    
    return YES;
}


#pragma mark -
#pragma mark NJKWebViewProgressDelegate

- (void)webViewProgress:(NJKWebViewProgress *)webViewProgress updateProgress:(float)progress
{
    
}

@end
