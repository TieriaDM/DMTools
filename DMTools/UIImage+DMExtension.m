//
//  UIImage+DMExtension.m
//  20150402-2-waterMark
//
//  Created by Tieria on 15-4-2.
//  Copyright (c) 2015年 HM. All rights reserved.
//

#import "UIImage+DMExtension.h"

@implementation UIImage (DMExtension)

#pragma mark - 添加水印方法

// 将logoImage作为水印绘制到img右下角指定位置，并返回一个UIImage对象
+ (instancetype)imageWithName:(NSString *)imgName AddWaterMarkWithImageName:(NSString *)logoImageName {
    
    // 加载底图
    UIImage *imgBG = [UIImage imageNamed:imgName];
    
    CGSize imgSize = imgBG.size;
    
    // 开启位图上下文
    UIGraphicsBeginImageContextWithOptions(imgSize, NO, 0.0);
    
    CGFloat imgX = 0;
    CGFloat imgY = 0;
    
    // 将底图绘制到界面上
    [imgBG drawInRect:(CGRect){{imgX, imgY},imgSize}];
    
    UIImage *logo = [UIImage imageNamed:logoImageName];
    
    CGFloat logoW = imgSize.width * 0.25;
    CGFloat logoH = imgSize.height * 0.25;
    CGFloat logoX = imgSize.width * 0.7;
    CGFloat logoY = imgSize.height *0.7;
    
    CGRect logoFrame = CGRectMake(logoX, logoY, logoW, logoH);
    [logo drawInRect:logoFrame];
    
    UIImage *finialImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 结束位图上下文
    UIGraphicsEndImageContext();
    
    return finialImage;
}

#pragma mark - 图片裁剪方法

// 根据传入图片在图片中心裁剪最大直径内切圆
+ (instancetype)clipRoundImageWithName:(NSString *)imgName {

    UIImage *img = [UIImage imageNamed:imgName];
    
    CGSize imgSize = img.size;
    
    UIGraphicsBeginImageContextWithOptions(imgSize, NO, 0.0);
    
    CGFloat shortBoundary = MIN(imgSize.width, imgSize.height); //MAX(imgSize.width, imgSize.height); Max(imgSize.width, imgSize.height);
    CGFloat imgRadius = shortBoundary * 0.5;
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGContextAddArc(ctx, (imgSize.width * 0.5), (imgSize.height * 0.5), imgRadius, 0, M_PI * 2, 0);
    
    CGContextClip(ctx);
    
    [img drawAtPoint:CGPointZero];
    
    UIImage *imgCliped = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    return imgCliped;
    
}

// 根据传入图片在图片中心裁剪最大内切椭圆
+ (instancetype)clipEllipseImageWithName:(NSString *)imgName {
    UIImage *img = [UIImage imageNamed:imgName];
    CGSize imgSize = img.size;
    
    UIGraphicsBeginImageContextWithOptions(imgSize, NO, 0.0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(ctx, (CGRect){CGPointZero, imgSize});
    
    CGContextClip(ctx);
    [img drawAtPoint:CGPointZero];

    
    UIImage *clipImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return clipImage;
}

// 根据传入图片在图片中心裁剪最大内切椭圆环，并指定圆环宽度及颜色
+ (instancetype)clipRoundImageWithName:(NSString *)imgName WithRingMargin:(CGFloat)margin WithColor:(UIColor *)color {
    
    UIImage *img = [UIImage imageNamed:imgName];
    CGSize imgSize = img.size;
    
    CGFloat contextW = imgSize.width + 2 * margin;
    CGFloat contextH = imgSize.height + 2 * margin;
    
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(contextW, contextH), NO, 0.0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    CGFloat bgRadius = MIN(contextH, contextW) / 2;
    CGFloat centerX = contextW * 0.5;
    CGFloat centerY = contextH * 0.5;
    
    CGContextAddArc(ctx, centerX, centerY, bgRadius, 0, M_PI * 2, 0);

    [color setFill];
    CGContextFillPath(ctx);
    
    CGFloat imgRadius = bgRadius - margin;
    
    CGContextAddArc(ctx, centerX, centerY, imgRadius, 0, M_PI * 2, 0);
    
    CGContextClip(ctx);
    
    [img drawInRect:CGRectMake(margin, margin, imgSize.width, imgSize.height)];
    
    UIImage *clipImageWithRing = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return clipImageWithRing;
}

@end
