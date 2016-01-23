//
//  forthViewController.m
//  testBlock
//
//  Created by fdkj0002 on 16/1/23.
//  Copyright © 2016年 fdkj0002. All rights reserved.
//

#import "forthViewController.h"

@interface forthViewController ()

@end

@implementation forthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"第四个界面";
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"返回第一个" forState:UIControlStateNormal];
    btn.frame = CGRectMake(100, 100, 100, 100);
    [btn addTarget:self action:@selector(btnclicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIButton * pop = [UIButton buttonWithType:UIButtonTypeSystem];
    [pop setTitle:@"上一个" forState:UIControlStateNormal];
    pop.frame = CGRectMake(100, 200, 100, 100);
    [pop addTarget:self action:@selector(popviewcontroller) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pop];
    
    

}
-(void)btnclicked{
    
    if (self.returnString) {
        self.returnString(@"第四个界面传过来的值");
    }
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}
-(void)popviewcontroller{
    if (self.returnString) {
        self.returnString(@"第四个界面传过来的值");
    }
    [self.navigationController popViewControllerAnimated:YES];
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
