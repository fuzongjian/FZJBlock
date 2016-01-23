//
//  ViewController.m
//  testBlock
//
//  Created by fdkj0002 on 16/1/12.
//  Copyright © 2016年 fdkj0002. All rights reserved.
//

#import "ViewController.h"
#import "secondViewController.h"

typedef void(^myblock) (id data);
@interface ViewController ()

@end

@implementation ViewController


/**
 *      利用block实现不同界面的回调传值
 *      可以实现二级界面传向一级界面
 *      可以实现三级界面传向一级界面
 *      可以实现四级界面传向一级界面
 *
 *      相对于代理来说block的传值更简单方便
 *
 */



- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = @"第一个界面";
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"下一个" forState:UIControlStateNormal];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [btn addTarget:self action:@selector(btnclicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
}

-(void)btnclicked{
    
    secondViewController * second = [[secondViewController alloc] init];
    
    second.returnString = ^(NSString * str){
        NSLog(@"我是第一个界面的回调---%@",str);
    };
    
    [self.navigationController pushViewController:second animated:YES];
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
