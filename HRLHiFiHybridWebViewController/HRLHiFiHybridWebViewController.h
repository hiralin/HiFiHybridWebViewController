//
//  HRLHiFiHybridWebViewController.h
//  HiFiHybridizationDemo
//
//  Created by Tokuya HIRAIZUMI on 2014/12/21.
//  Copyright (c) 2014年 Tokuya HIRAIZUMI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <NJKWebViewProgress/NJKWebViewProgress.h>

@interface HRLHiFiHybridWebViewController : UIViewController <NJKWebViewProgressDelegate,UIWebViewDelegate>

@property (nonatomic, strong, readonly) UIWebView *webView;

// TODO: to be more cool interface
- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
                      urlString:(NSString *)urlString;

@end
