//
//  UIImage+DMExtension.h
//  20150402-2-waterMark
//
//  Created by Tieria on 15-4-2.
//  Copyright (c) 2015年 HM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (DMExtension)

#pragma mark - 添加水印方法
// 将logoImage作为水印绘制到img右下角指定位置，并返回一个UIImage对象
+ (instancetype)imageWithName:(NSString *)imgName AddWaterMarkWithImageName:(NSString *)logoImageName;

#pragma mark - 图片裁剪方法
// 根据传入图片在图片中心裁剪最大直径内切圆
+ (instancetype)clipRoundImageWithName:(NSString *)imgName;
// 根据传入图片在图片中心裁剪最大内切椭圆
+ (instancetype)clipEllipseImageWithName:(NSString *)imgName;
// 根据传入图片在图片中心裁剪最大内切椭圆环，并指定圆环宽度及颜色
+ (instancetype)clipRoundImageWithName:(NSString *)imgName WithRingMargin:(CGFloat)margin WithColor:(UIColor *)color;
@end
