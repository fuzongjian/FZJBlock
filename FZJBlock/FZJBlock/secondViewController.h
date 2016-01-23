//
//  secondViewController.h
//  testBlock
//
//  Created by fdkj0002 on 16/1/23.
//  Copyright © 2016年 fdkj0002. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface secondViewController : UIViewController

/**
 *  将block定义为属性
 */

@property(nonatomic,copy)void(^returnString)(NSString * str);




@end
