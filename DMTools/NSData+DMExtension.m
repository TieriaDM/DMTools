//
//  NSData+DMExtension.m
//  20150402-2-waterMark
//
//  Created by Tieria on 15-4-2.
//  Copyright (c) 2015年 HM. All rights reserved.
//

#import "NSData+DMExtension.h"



@implementation NSData (DMExtension)

/**
 *  CN:
 *  将UIImage对象保存到/Documents路径下,指定文件名finalFileName
 *  保存格式为“yyyy-MM-dd-mm-ss-finalFileName.png”
 *
 *  EN:
 *  Save UIImage object in sandbox under /Documents with name:"finalFileName"
 *  The final file name is “yyyy-MM-dd-mm-ss-finalFileName.png”.
 */
+ (void)writePNGImage:(UIImage *)image WithName:(NSString *)finalFileName {
    // 将image图片转换为PNG二进制数据
    NSData *imgData = UIImagePNGRepresentation(image);
    
    // 获取Documents文件夹路径
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    
    // 获取当前时间并保存转化为特定格式字符串
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd-mm-ss-";
    // 合成文件名字符串
    NSString *currentTime = [dateFormatter stringFromDate:currentDate];
    NSString *name = finalFileName;
    NSString *postfix = @".png";
    
    NSArray *nameArray = @[currentTime, name, postfix];
    NSMutableString *string = [NSMutableString string];
    for (NSString *str in nameArray) {
        [string appendString:str];
    }
    // 合成全路径文件名
    NSString *fileName = [docPath stringByAppendingPathComponent:string];
    // 将二进制数据写为文件
    [imgData writeToFile:fileName atomically:YES];
    NSLog(@"%@", fileName);
}




@end
