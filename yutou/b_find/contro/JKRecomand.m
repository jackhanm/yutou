//
//  JKRecomand.m
//  yutou
//
//  Created by 余浩 on 2018/7/27.
//  Copyright © 2018年 jack. All rights reserved.
//

#import "JKRecomand.h"
#import "JKRecomandcell.h"
#import "JKRecomandModel.h"

@interface JKRecomand ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *modelArray;
@property (nonatomic, strong) UIViewController *controller;

@end

@implementation JKRecomand
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.view addSubview:self.tableView];
        [self loadData];
    }
    return self;
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [tableView setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 150;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.modelArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JKRecomandcell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([JKRecomandcell class])];
    cell.backgroundColor =randomColor;
    cell.RecomandModel = [self.modelArray objectAtIndex:indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate tableviewdidSelectRowAtIndexPath:indexPath];
}

- (void)loadData {
    
    for (unsigned long i = 0; i<10; i++) {
        JKRecomandModel *model = [[JKRecomandModel alloc] init];
        
        model.title = @"jack";
        [self.modelArray addObject:model];
        
    }
    
    [self.tableView reloadData];
}



- (UITableView *)tableView {
    if (!_tableView) {
        
        _tableView  = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDGHT, HEIGHT)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[JKRecomandcell class] forCellReuseIdentifier:NSStringFromClass([JKRecomandcell class])];
        
        
        UIView *tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,  WIDGHT, 475)];
        tableHeaderView.backgroundColor = [UIColor whiteColor];
        
        _tableView.scrollIndicatorInsets = UIEdgeInsetsMake(182, 0, 0, 0);
        _tableView.tableHeaderView = tableHeaderView;
        
        
        
    }
    return _tableView;
}

- (NSMutableArray *)modelArray {
    if (!_modelArray) {
        
        _modelArray = [NSMutableArray array];
    }
    return _modelArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
