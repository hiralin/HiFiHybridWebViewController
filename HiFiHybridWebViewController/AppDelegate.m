//
//  AppDelegate.m
//  HiFiHybridWebViewController
//
//  Created by Tokuya HIRAIZUMI on 2014/12/21.
//  Copyright (c) 2014年 Tokuya HIRAIZUMI. All rights reserved.
//

#import "AppDelegate.h"
#import "HRLHiFiHybridWebViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    UITabBarController *rootTabBarController = (UITabBarController*)self.window.rootViewController;

    // TODO: be plist implement
    NSArray * titles = @[@"home",
                         @"search",
                         @"proposing",
                         @"fav",
                         @"info"];
    
    NSArray * urls = @[@"https://prime.heyazine.com/top",
                       @"https://prime.heyazine.com/search",
                       @"https://prime.heyazine.com/proposing_items",
                       @"https://prime.heyazine.com/favorites",
                       @"https://prime.heyazine.com/faq"];

    NSArray * icons = @[@"icons/house28",
                        @"icons/observation3",
                        @"icons/man93",
                        @"icons/heart56",
                        @"icons/information27"];
    
    for (int i = 0; i < [titles count]; i++) {
        HRLHiFiHybridWebViewController *vc = [[HRLHiFiHybridWebViewController alloc] initWithNibName:nil bundle:nil urlString:urls[i]];
        
        UIImage *resizedImage = [AppDelegate resizedImage:[UIImage imageNamed:icons[i]] width:28 height:28];
        
        UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:vc];
        nvc.tabBarItem.title = titles[i];
        nvc.tabBarItem.image = resizedImage;
        
        [rootTabBarController addChildViewController:nvc];
    }
    
    return YES;
}

+ (UIImage *)resizedImage:(UIImage *)image width:(CGFloat)width height:(CGFloat)height
{
    if (UIGraphicsBeginImageContextWithOptions != NULL) {
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(width, height), NO, [[UIScreen mainScreen] scale]);
    } else {
        UIGraphicsBeginImageContext(CGSizeMake(width, height));
    }
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetInterpolationQuality(context, kCGInterpolationHigh);
    
    [image drawInRect:CGRectMake(0.0, 0.0, width, height)];
    
    UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return resizedImage;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
