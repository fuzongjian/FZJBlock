//
//  ViewController.m
//  testBlock
//
//  Created by fdkj0002 on 16/1/12.
//  Copyright © 2016年 fdkj0002. All rights reserved.
//

#import "ViewController.h"
#import "secondViewController.h"
typedef int(^returnValue)(int,int);
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
    
    [self blockStudy];
    
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

#pragma mark --- block的一般使用
- (void)blockStudy{
    [self blockStudy_first];
}
- (void)blockStudy_first{
    
    
    returnValue  value = ^(int a,int b){
        return a + b;
    };
     NSLog(@"sixth===%d",value(4755,4445));
    
    int(^returnBlock)(int,int) = ^(int a,int b){
        return a+b;
    };
     NSLog(@"first===%d",returnBlock(5,6));
    
    
    void(^returnSecond)(int,int) = ^(int a,int b){
         NSLog(@"second===%d",a+b);
    };
    returnSecond(7,8);
    
    
    void(^returnThird)(void) = ^{
        NSLog(@"third");
    };
    returnThird();
    
    __block int a = 10;
    int b = 39;
    void(^returnForth)(void) = ^{
        a = 324;
         NSLog(@"%d---%d",a,b);
    };
    returnForth();
    
    [self gotowork:^{
        NSLog(@"gotowork");
    }];
    
}
- (void)gotowork:(void(^)())dosomething{
    NSLog(@"getup");
    NSLog(@"wash");
    if (dosomething) {
        dosomething();
    }
    NSLog(@"workoff");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
