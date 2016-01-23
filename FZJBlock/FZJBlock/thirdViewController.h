//
//  thirdViewController.h
//  testBlock
//
//  Created by fdkj0002 on 16/1/23.
//  Copyright © 2016年 fdkj0002. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface thirdViewController : UIViewController

@property(nonatomic,copy)void(^returnString)(NSString * str);

@end
