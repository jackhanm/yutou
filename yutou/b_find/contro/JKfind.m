//
//  JKfind.m
//  yutou
//
//  Created by 余浩 on 2018/7/16.
//  Copyright © 2018年 jack. All rights reserved.
//

#import "JKfind.h"
#import "JKtableviewController.h"
#define CATEGORY  @[@"推荐",@"原创",@"热门",@"美食",@"生活"]
@interface JKfind ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *bottomScrollView;;
@end

@implementation JKfind
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createview];
    // Do any additional setup after loading the view.
}
-(void)createview
{
    [self.view addSubview:self.bottomScrollView];
}
#pragma mark
-(UIScrollView *)bottomScrollView
{
    if (!_bottomScrollView) {
        _bottomScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, WIDGHT,HEIGHT )];
        _bottomScrollView.delegate =self;
        _bottomScrollView.pagingEnabled =YES;
        for (int i =0; i < CATEGORY.count; i++) {
            JKtableviewController *tableviewvc = [[JKtableviewController alloc]init];
            tableviewvc.view.frame = CGRectMake(WIDGHT * i, 0, WIDGHT, HEIGHT);
        }
    }
    return _bottomScrollView;
}















@end


