//
//  thirdViewController.m
//  testBlock
//
//  Created by fdkj0002 on 16/1/23.
//  Copyright © 2016年 fdkj0002. All rights reserved.
//

#import "thirdViewController.h"
#import "forthViewController.h"
@interface thirdViewController ()

@end

@implementation thirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"第三个界面";
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"返回第一个" forState:UIControlStateNormal];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [btn addTarget:self action:@selector(btnclicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    UIButton * next = [UIButton buttonWithType:UIButtonTypeSystem];
    [next setTitle:@"下一个" forState:UIControlStateNormal];
    next.frame = CGRectMake(100, 200, 100, 100);
    [next addTarget:self action:@selector(nextBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:next];
    
    UIButton * pop = [UIButton buttonWithType:UIButtonTypeSystem];
    [pop setTitle:@"上一个" forState:UIControlStateNormal];
    pop.frame = CGRectMake(100, 300, 100, 100);
    [pop addTarget:self action:@selector(popviewcontroller) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pop];
    
    
    
    
    
}

-(void)btnclicked{
    
    if (self.returnString) {
        self.returnString(@"第三个界面传过来的值");
    }
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)popviewcontroller{
    
    if (self.returnString) {
        self.returnString(@"第三个界面传过来的值");
    }
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)nextBtnClicked{
    
    forthViewController * forth = [[forthViewController alloc] init];
    forth.returnString = self.returnString;
    
    forth.returnString = ^(NSString * str){
        NSLog(@"我是第三个界面的回调---%@",str);
        
        /**
         *  此处是实现值的连续传递 如果不实现的话当前控制不能将值传递给上一个界面
         */
        
        self.returnString(str);
    };
    
    [self.navigationController pushViewController:forth animated:YES];
    
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
