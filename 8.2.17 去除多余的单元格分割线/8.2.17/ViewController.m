//
//  ViewController.m
//  8.2.17
//
//  Created by 李维佳 on 2017/4/2.
//  Copyright © 2017年 Liz. All rights reserved.
//

#import "ViewController.h"
#import "MYTableViewCell.h"
#import "MYModel.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,copy)NSMutableArray *rowDataArray;
@end

@implementation ViewController

- (NSMutableArray *)rowDataArray {
    if (_rowDataArray == nil) {
        _rowDataArray = [NSMutableArray array];
        for (int i = 0; i<3; i++) {
            MYModel *model = [MYModel myCellModel];
            [_rowDataArray addObject:model];
        }
    }
    return _rowDataArray;
}

- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        //设置代理和数据源
        _tableView.delegate = self;
        _tableView.dataSource = self;
        //分割线与屏幕等宽
        _tableView.separatorInset = UIEdgeInsetsMake(1, 0, 1, 0);
        //分割线颜色
        _tableView.separatorColor = [UIColor blackColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        _tableView.rowHeight = 125;
        //设置footerview
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor clearColor];
        self.tableView.tableFooterView = view;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark->delegate/dataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.rowDataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MYTableViewCell *cell = [MYTableViewCell cellWithTableView:tableView];
    MYModel * cellData = [MYModel myCellModel];
    cell.cellData = cellData;
    return cell;
}

@end
