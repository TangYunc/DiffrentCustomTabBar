//
//  UIImage+Extension.h
//  DiffrentCustomTabBar
//
//  Created by tangyunchuan on 2018/8/8.
//  Copyright © 2018年 tangyunchuan. All rights reserved.
//

#import <UIKit/UIKit.h>

// 设置颜色
#define BXColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define BXAlphaColor(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

@interface UIImage (Extension)

/**
 *  用颜色返回一张图片
 */
+ (UIImage *)generateImageFromColor:(UIColor *)color;
@end
