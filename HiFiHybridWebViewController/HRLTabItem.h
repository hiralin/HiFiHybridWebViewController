//
//  HRLTabItem.h
//  HiFiHybridWebViewController
//
//  Created by Tokuya HIRAIZUMI on 2014/12/22.
//  Copyright (c) 2014年 Tokuya HIRAIZUMI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HRLTabItem : NSObject

+ (NSArray*)tabItems:(NSArray*)metadataArray;

@property (nonatomic, readonly) NSString *url;
@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) UIImage *icon;
@end
