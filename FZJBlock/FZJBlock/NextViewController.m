//
//  NextViewController.m
//  FZJBlock
//
//  Created by Shao Jie on 16/7/8.
//  Copyright © 2016年 FZJ.com. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()
@property (nonatomic,copy) void(^block)();
@property (nonatomic,strong) NSString * name;
@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.name = @"fuzongjian";
    __weak __typeof (self) weakSelf = self;
    self.block = ^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
             NSLog(@"%@",weakSelf.name);
        });
//        NSLog(@"%@",weakSelf.name);
    };
    self.block();
    
    
}
- (void)dealloc{
    NSLog(@"%s",__func__);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
