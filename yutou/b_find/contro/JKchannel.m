//
//  JKchannel.m
//  yutou
//
//  Created by 余浩 on 2018/7/25.
//  Copyright © 2018年 jack. All rights reserved.
//

#import "JKchannel.h"
#import "JKChannelitem.h"
#import "JKChannelItemhead.h"
@interface JKchannel ()<UICollectionViewDataSource,UICollectionViewDelegate,UIGestureRecognizerDelegate>
@property (nonatomic ,strong)UIImageView *closeimg;
@property (nonatomic, strong)UIView *closeimgback;
@property (nonatomic, strong)UICollectionView *collectionView;
@property(nonatomic,assign) BOOL isEdit;
@property (nonatomic, retain)NSMutableArray *dataSourceArr;
@property (nonatomic, retain)NSMutableArray *DataArr;

@property (nonatomic, strong) UILongPressGestureRecognizer *longPress;
@property (nonatomic, strong) UIPanGestureRecognizer *panGestureRecognizer;
@end

@implementation JKchannel

- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor = UIColorFromRGB(0xf8f8f8);
    [self createview];
    // Do any additional setup after loading the view.
}
-(void)createview
{
    _dataSourceArr = [NSMutableArray arrayWithArray:@[@"热门推荐",@"我的关注",@"区块链",@"证券",@"黄金",@"货币"]] ;
    _DataArr = [NSMutableArray arrayWithArray:@[@"期货",@"国际经济",@"公募基金",@"私募基金",@"P2P1",@"P2P2",@"P2P3",@"P2P4"]];
    
    [self.view addSubview:self.closeimgback];
    [self.view addSubview:self.collectionView];
    //长按拖动排序手势
    _longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(lonePressMoving:)];
    [self.collectionView addGestureRecognizer:_longPress];
}
#pragma mark 点击事件
-(void)closeAct{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
#pragma mark lazy
-(UIView *)closeimgback
{
    if (!_closeimgback) {
        _closeimgback = [[UIView alloc]initWithFrame:CGRectMake(WIDGHT - 50, 0, 50, 60)];
        _closeimg = [[UIImageView alloc]initWithFrame:CGRectMake(42/widthreal, 35, 16, 16)];
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
        _collectionView  =[[UICollectionView alloc]initWithFrame:CGRectMake(0, 50, WIDGHT, HEIGHT-100) collectionViewLayout:layout];
        _collectionView.delegate =self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = UIColorFromRGB(0xf8f8f8);
        [_collectionView registerClass:[JKChannelitem class] forCellWithReuseIdentifier:@"channel"];
         [_collectionView registerClass:[JKChannelItemhead class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"channelHead"];//注册头视图
        
    }
    return _collectionView;
}
#pragma mark delegates
//设置头部自定义视图

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableView = nil;
    
    if (kind ==UICollectionElementKindSectionHeader) {
        JKChannelItemhead *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"channelHead" forIndexPath:indexPath];
        
        if(indexPath.section==0){
            headerView.mainLable.text=@"我的栏目";
            headerView.editBtn.hidden=NO;
            headerView.editAct = ^{
                self.isEdit=!self.isEdit;
                [self.collectionView reloadData];
            };
            if(_isEdit){
                [headerView.editBtn setTitle:@"完成" forState:UIControlStateNormal];
                headerView.subLable.text=@"拖拽可以排序";
            }else{
                [headerView.editBtn setTitle:@"编辑" forState:UIControlStateNormal];
                headerView.subLable.text=@"点击进入频道";
            }
        }else{
            headerView.mainLable.text=@"添加栏目";
            headerView.subLable.text=@"点击添加频道";
            headerView.editBtn.hidden=YES;
        }
//        headerView.delegate=self;
        reusableView = headerView;
    }
    if (kind == UICollectionElementKindSectionFooter){
        
    }
    return reusableView;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return  _dataSourceArr.count;
    }else{
        return _DataArr.count;
    }
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.section==0)
    {
        JKChannelitem *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"channel" forIndexPath:indexPath];
        cell.titlelabel.text =[NSString stringWithFormat:@"%@", _dataSourceArr[indexPath.row]];
        cell.isEdit=_isEdit;
        cell.num = indexPath.row;
        cell.layer.cornerRadius = 5;
        cell.deleteAct = ^(NSInteger sender) {
            [self.dataSourceArr removeObjectAtIndex:sender-1];
            [self.collectionView deleteItemsAtIndexPaths:@[[NSIndexPath  indexPathForRow:sender-1 inSection:0]]];
        };
        if ([cell.titlelabel.text isEqualToString:@"热门推荐"] ||[cell.titlelabel.text isEqualToString:@"我的关注"] ) {
            cell.titlelabel.textColor = UIColorFromRGB(themeColor);
            cell.backgroundColor = UIColorFromRGB(0xf8f8f8);
        }
        return cell;
        
      
    }else{
        JKChannelitem *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"channel" forIndexPath:indexPath];
        cell.titlelabel.text =[NSString stringWithFormat:@"%@", _DataArr[indexPath.row]];
         cell.layer.cornerRadius = 5;
        return cell;
    }
    
    
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return UIEdgeInsetsMake(5, 10, 5, 5);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat itemWidth = (WIDGHT - 15 - 20-20) / 4;
    CGFloat itemHeight = 44;
    return CGSizeMake(itemWidth, itemHeight);
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    JKLog(@"%d %d",indexPath.row,indexPath.section);
    if(indexPath.section==0){
        
    }else{
       
 // colloct 隐藏bug  名字相同会复用 delete 会失败
        [_dataSourceArr addObject:_DataArr[indexPath.row]];
        [self.collectionView insertItemsAtIndexPaths:@[[NSIndexPath indexPathForItem:_dataSourceArr.count-1 inSection:0]]];
        [_DataArr removeObject:_DataArr[indexPath.row]];
        [self.collectionView deleteItemsAtIndexPaths:@[[NSIndexPath  indexPathForRow:indexPath.row inSection:1]]];
    }
}
- (void)lonePressMoving:(UILongPressGestureRecognizer *)longPress
{
    
    NSIndexPath *selectIndexPath = [self.collectionView indexPathForItemAtPoint:[_longPress locationInView:self.collectionView]];
    switch (_longPress.state) {
        case UIGestureRecognizerStateBegan: {
            {
                if(_isEdit&&selectIndexPath.section==0)
                    [_collectionView beginInteractiveMovementForItemAtIndexPath:selectIndexPath];
                else{
                    _isEdit=YES;
                    if(selectIndexPath&&selectIndexPath.section==0)
                        [_collectionView beginInteractiveMovementForItemAtIndexPath:selectIndexPath];
                    [self.collectionView reloadData];
                    
                }
            }
            break;
        }
        case UIGestureRecognizerStateChanged: {
            
            [self.collectionView updateInteractiveMovementTargetPosition:[longPress locationInView:_longPress.view]];
            break;
        }
        case UIGestureRecognizerStateEnded: {
            [self.collectionView endInteractiveMovement];
            break;
        }
        default: [self.collectionView cancelInteractiveMovement];
            break;
    }
}
- (void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(nonnull NSIndexPath *)sourceIndexPath toIndexPath:(nonnull NSIndexPath *)destinationIndexPath
{
    if(!_isEdit||sourceIndexPath.section==1)
        return;
    // 找到当前的cell
    NSMutableArray *arr=_dataSourceArr;
    [arr exchangeObjectAtIndex:sourceIndexPath.item withObjectAtIndex:destinationIndexPath.item];
    //[self.collectionView reloadData];
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
