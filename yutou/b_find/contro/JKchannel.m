//
//  JKchannel.m
//  yutou
//
//  Created by 余浩 on 2018/7/25.
//  Copyright © 2018年 jack. All rights reserved.
//

#import "JKchannel.h"

@interface JKchannel ()<UICollectionViewDataSource,UICollectionViewDataSource>
@property (nonatomic ,strong)UIImageView *closeimg;
@property (nonatomic, strong)UIView *closeimgback;
@property (nonatomic, strong)UICollectionView *collectionView;
@end

@implementation JKchannel

- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor = [UIColor whiteColor];
    [self createview];
    // Do any additional setup after loading the view.
}
-(void)createview
{
    [self.view addSubview:self.closeimgback];
    
}
#pragma mark 点击事件
-(void)closeAct{
    
}
#pragma mark lazy
-(UIView *)closeimgback
{
    if (!_closeimgback) {
        _closeimgback = [[UIView alloc]initWithFrame:CGRectMake(WIDGHT - 40, 0, 40, 40)];
        _closeimg = [[UIImageView alloc]initWithFrame:CGRectMake(12/widthreal, 26/heightreal, 16, 16)];
        _closeimg.image = kLGetImage(@"栏目关闭");
        [_closeimgback addSubview:_closeimg];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closeAct)];
        [_closeimgback addGestureRecognizer:tap];
    }
    return _closeimgback;
}
-(UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
        layout.headerReferenceSize = CGSizeMake(WIDGHT, 50);
        _collectionView  =[[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, WIDGHT, HEIGHT-100) collectionViewLayout:layout];
        _collectionView.delegate =self;
        _collectionView.dataSource = self;
        
    }
    return _collectionView;
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
