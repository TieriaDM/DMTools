//
//  NSData+DMExtension.h
//  20150402-2-waterMark
//
//  Created by Tieria on 15-4-2.
//  Copyright (c) 2015年 HM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSData (DMExtension)

// 将UIImage对象保存到/Documents路径下,指定文件名finialFileName
// 保存格式为“yyyy-MM-dd-mm-ss-finialFileName.png”
+ (void)writePNGImage:(UIImage *)image WithName:(NSString *)finalFileName;

@end
