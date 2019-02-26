//
//  XLLMineController.m
//  XLLNavigationAlpha
//
//  Created by 肖乐 on 2018/11/2.
//  Copyright © 2018年 iOSCoder. All rights reserved.
//

#import "XLLMineController.h"
#import "UIViewController+Alpha.h"
#import "XLLHeadView.h"
#import "XLLNextController.h"

@interface XLLMineController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView;
@property (nonatomic, weak) XLLHeadView *headView;

@end

@implementation XLLMineController
static NSString *const ID = @"UITableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navAlpha = 0.0;
    self.navTintColor = [UIColor yellowColor];
    [self setupTableView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navTitleFont = [UIFont systemFontOfSize:20];
    self.navTitleColor = self.navTitleColor?self.navTitleColor:[UIColor redColor];
}

- (void)setupTableView
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tableView.showsVerticalScrollIndicator = NO;
    tableView.showsHorizontalScrollIndicator = NO;
    if (@available(iOS 11.0, *)) {
        tableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0);
    XLLHeadView *headView = [XLLHeadView xibView];
    tableView.tableHeaderView = headView;
    self.headView = headView;
    [self.view addSubview:tableView];
    self.tableView = tableView;
}

#pragma mark - delegate, dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        [tableView registerClass:NSClassFromString(ID) forCellReuseIdentifier:ID];
        cell = [tableView dequeueReusableCellWithIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"第%zd行", indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    XLLNextController *nextVC = [[XLLNextController alloc] init];
    nextVC.signRow = indexPath.row;
    [self.navigationController pushViewController:nextVC animated:YES];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([scrollView isEqual:self.tableView])
    {
        CGFloat currentOffsetY = scrollView.contentOffset.y;
        CGFloat alpha = (currentOffsetY-64)*1.0/(self.headView.frame.size.height-64.0+scrollView.contentInset.top);
        self.navAlpha = alpha;
        self.navTitleColor = alpha>=1.0?[UIColor whiteColor]:[UIColor redColor];
        self.backImgName = alpha>=1.0?@"back_normal_white":@"back_normal";
    }
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.tableView.frame = self.view.bounds;
    self.headView.frame = CGRectMake(0, 0, self.view.frame.size.width, 240);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
