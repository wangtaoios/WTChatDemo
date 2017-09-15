//
//  WTChatVC.m
//  WTChatDemo
//
//  Created by wangtao on 2017/9/15.
//  Copyright © 2017年 xkxz. All rights reserved.
//

#import "WTChatVC.h"
#import "WTChatCell.h"
#import "WTChatFooterView.h"
#import "WTChat.h"
#import <MJRefresh.h>


@interface WTChatVC () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, assign) NSInteger page;

@property (nonatomic, weak) WTChatFooterView *footerView;

@end

@implementation WTChatVC

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat contentOffsetY = scrollView.contentOffset.y;
    
    if (contentOffsetY > 10) {
        if (self.footerView.isFirst) {
            [self clickSelf];
        }
    }
    
    if (contentOffsetY < - 10) {
        self.footerView.isFirst = YES;
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    [IQKeyboardManager sharedManager].enable = NO;
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.view endEditing:YES];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    [IQKeyboardManager sharedManager].enableAutoToolbar = YES;
    [IQKeyboardManager sharedManager].enable = YES;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];

    [self setupTableView];
    
    [self addFooter];
    
}

- (void)setupTableView
{
    self.automaticallyAdjustsScrollViewInsets = NO;

    UITableView *tableView =
    [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kMainScreenWidth, kMainScreenHeight - 64)
                                 style:UITableViewStylePlain];
    
    tableView.backgroundColor = kWhiteColor;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.tableHeaderView = [[UIView alloc] init];
    tableView.tableFooterView = [[UIView alloc] init];
    
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    //    旋转tableView
    self.tableView.transform = CGAffineTransformMakeScale (1, -1);
    self.tableView.tableHeaderView.transform = CGAffineTransformMakeScale (1, -1);
    self.tableView.tableFooterView.transform = CGAffineTransformMakeScale (1, -1);
    
    self.view.backgroundColor = WTHexColor(0xeaeaea);
    self.tableView.backgroundColor = WTHexColor(0xeaeaea);
    self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(50, 0, 0, 0);
    
    [self.tableView registerClass:[WTChatCell class] forCellReuseIdentifier:WTChatCellID];
    [self.tableView registerClass:[WTChatFooterView class] forHeaderFooterViewReuseIdentifier:WTChatFooterViewID];
    
    [self.tableView wt_addTapTarget:self action:@selector(clickSelf)];
    
}

- (void)keyboardWillShow:(NSNotification*)notification
{
    CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat transformY = keyboardFrame.origin.y - self.view.frame.size.height;
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:NO];
    
    WTWS(weakSelf);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.05 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [UIView animateWithDuration:duration animations:^{
            self.tableView.frame = CGRectMake(self.tableView.wt_x, self.tableView.wt_y, self.tableView.wt_width, kMainScreenHeight - 64 - keyboardFrame.size.height);
            weakSelf.inputView.transform = CGAffineTransformMakeTranslation(0, transformY);
            weakSelf.footerView.isFirst = YES;
            
        }];
    });
    
}

- (void)keyboardWillHide:(NSNotification*)notification
{
    CGFloat duration = [notification.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    [UIView animateWithDuration:duration animations:^{
        self.tableView.frame = CGRectMake(self.tableView.wt_x, self.tableView.wt_y, self.tableView.wt_width, kMainScreenHeight - 64);
        self.view.transform = CGAffineTransformIdentity;
        
    }];
    
}

- (void)clickSelf
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kMessageState object:@(YES)];
}

- (void)addFooter
{
    [self loadData];
    
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    
    [footer setTitle:@"" forState:MJRefreshStateIdle];
    [footer setTitle:@"" forState:MJRefreshStatePulling];
    [footer setTitle:@"" forState:MJRefreshStateRefreshing];
    [footer setTitle:@"" forState:MJRefreshStateWillRefresh];
    [footer setTitle:@"" forState:MJRefreshStateNoMoreData];
    
    self.tableView.mj_footer = footer;
    
}

- (void)loadData
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSArray* newData = [WTUtils dataArray];
        NSArray* reversedArray = [[newData reverseObjectEnumerator] allObjects];
        self.dataArray = [NSMutableArray arrayWithArray:reversedArray];
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
    });

}

- (void)loadMoreData
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSArray* newData = [WTUtils dataArray];
        NSArray* reversedArray = [[newData reverseObjectEnumerator] allObjects];
        [self.dataArray addObjectsFromArray:reversedArray];
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshingWithNoMoreData];
    });
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    WTChatFooterView *footer = [tableView dequeueReusableHeaderFooterViewWithIdentifier:WTChatFooterViewID];
    self.footerView = footer;
    footer.contentView.transform = CGAffineTransformMakeScale (1, -1);
    
    WTWS(weakSelf);
    footer.clickSenderText = ^(NSString *text) {

//        [weakSelf loadData];
        
        WTChat *model = [[WTChat alloc] init];
        model.realName = @"大帅哥";
        model.headImg = @"/image/20170629/20170629182527_826.png";
        model.comment = text;
        model.isShow = @"0";
        model.addTime = @"2017-06-02";
        [weakSelf.dataArray insertObject:model atIndex:0];
        [weakSelf.tableView reloadData];
        
        weakSelf.footerView.sendSucceed = YES;

    };
    
    footer.resignFirstRes = ^{
        self.tableView.frame = CGRectMake(self.tableView.wt_x, self.tableView.wt_y, self.tableView.wt_width, kMainScreenHeight - 64);
        weakSelf.view.transform = CGAffineTransformIdentity;
    };
    return footer;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.dataArray) {
        return 1;
    }
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WTChat *model = self.dataArray[indexPath.row];
    return model.height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WTChatCell *cell = [tableView dequeueReusableCellWithIdentifier:WTChatCellID forIndexPath:indexPath];
    cell.model = self.dataArray[indexPath.row];
    cell.contentView.transform = CGAffineTransformMakeScale (1, -1);
    return cell;
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
