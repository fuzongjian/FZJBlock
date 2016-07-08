//
//  secondViewController.m
//  testBlock
//
//  Created by fdkj0002 on 16/1/23.
//  Copyright © 2016年 fdkj0002. All rights reserved.
//

#import "secondViewController.h"
#import "thirdViewController.h"



@interface secondViewController ()

@end

@implementation secondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"第二个界面";
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"上一个" forState:UIControlStateNormal];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [btn addTarget:self action:@selector(btnclicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton * next = [UIButton buttonWithType:UIButtonTypeSystem];
    [next setTitle:@"下一个" forState:UIControlStateNormal];
    next.frame = CGRectMake(100, 200, 100, 100);
    [next addTarget:self action:@selector(nextBtnclicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:next];
    
    

}
-(void)btnclicked{
    
    if (self.returnString) {
        self.returnString(@"第二个界面穿过来的值");
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)nextBtnclicked{
    
    thirdViewController * third = [[thirdViewController alloc] init];
    third.returnString = self.returnString;
    
    third.returnString = ^(NSString * str){
        
        NSLog(@"我是第二个界面的回调---%@",str);
        
        /**
         *  此处是实现值的连续传递 如果不实现的话当前控制不能将值传递给上一个界面
         */
        
        self.returnString(str);
        
    };
    
    [self.navigationController pushViewController:third animated:YES];

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
