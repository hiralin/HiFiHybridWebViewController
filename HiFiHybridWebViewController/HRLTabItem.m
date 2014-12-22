//
//  HRLTabItem.m
//  HiFiHybridWebViewController
//
//  Created by Tokuya HIRAIZUMI on 2014/12/22.
//  Copyright (c) 2014年 Tokuya HIRAIZUMI. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HRLTabItem.h"

@implementation HRLTabItem
{
    NSString    *_url;
    NSString    *_title;
    UIImage     *_icon;
}

+ (NSArray*)tabItems:(NSArray*)metadataArray
{
    NSMutableArray *items = [NSMutableArray array];
    for (NSDictionary* metadata in metadataArray) {
        HRLTabItem * item = [[HRLTabItem alloc] initWithMetadata:metadata];
        [items addObject:item];
    }
    
    return items;
}

- (instancetype)initWithMetadata:(NSDictionary*)metadata
{
    self = [super init];
    if (self) {
        _url = metadata[@"url"];
        _title = metadata[@"title"];
        _icon = [HRLTabItem resizedImage:[UIImage imageNamed:metadata[@"iconpath"]] width:28 height:28];
    }
    
    return self;
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


@end
