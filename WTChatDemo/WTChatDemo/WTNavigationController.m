//
//  WTNavigationController.m
//  WTChatDemo
//
//  Created by wangtao on 2017/9/15.
//  Copyright © 2017年 xkxz. All rights reserved.
//

#import "WTNavigationController.h"

@interface WTNavigationController ()

@end

@implementation WTNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //    [self.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    
    // 如果滑动移除控制器的功能失效，清空代理(让导航控制器重新设置这个功能)
    self.interactivePopGestureRecognizer.delegate = nil;
    
    NSDictionary *textAttributes = @{
                                     NSFontAttributeName : [UIFont systemFontOfSize:18],
                                     NSForegroundColorAttributeName : kWhiteColor
                                     };
    [[UINavigationBar appearance] setTitleTextAttributes:textAttributes];
    
    self.navigationBar.barTintColor = kNavigationBarColor;
    
}

/**
 * 可以在这个方法中拦截所有push进来的控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.childViewControllers.count > 0) { // 如果push进来的不是第一个控制器
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
        [button setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    // 这句super的push要放在后面, 让viewController可以覆盖上面设置的leftBarButtonItem
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
    [self popViewControllerAnimated:YES];
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
