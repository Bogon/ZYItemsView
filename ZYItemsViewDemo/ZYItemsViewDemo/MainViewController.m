//
//  MainViewController.m
//  UIComponentPrivatePods
//
//  Created by 张奇 on 16/7/14.
//  Copyright © 2016年 zhangqi. All rights reserved.
//

#import "MainViewController.h"
#import "ItemsView.h"

#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"私有化组件";
    self.view.backgroundColor = [UIColor whiteColor];
    NSArray *itemArray = @[@"一键结婚",@"一键律师",@"一键家政",@"一键医生"];
    ItemsView *itemView = [[ItemsView alloc] initWithFrame:CGRectMake(0, 100, kScreenWidth, (kScreenWidth/3.0)*((itemArray.count+2)/3)) itemsTitleArray:itemArray callBackComplement:^(int index) {
        NSLog(@"index = %d",index);
    }];
    [self.view addSubview:itemView];
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
