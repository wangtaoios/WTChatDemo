//
//  ViewController.m
//  WTChatDemo
//
//  Created by wangtao on 2017/9/15.
//  Copyright © 2017年 xkxz. All rights reserved.
//

#import "ViewController.h"
#import "WTChatVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.navigationItem.title = @"点击查看聊天";
    self.view.backgroundColor = kWhiteColor;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    
    WTChatVC *vc = [[WTChatVC alloc] init];
    vc.navigationItem.title = @"西开金服官方";
    [self.navigationController pushViewController:vc animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
