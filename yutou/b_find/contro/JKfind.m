//
//  JKfind.m
//  yutou
//
//  Created by 余浩 on 2018/7/16.
//  Copyright © 2018年 jack. All rights reserved.
//

#import "JKfind.h"
#import "JKRecomand.h"
#import "JKchannel.h"
#import "TYCyclePagerView.h"
#import "TYPageControl.h"
#import "JKPublishState.h"
#import "JKSearch.h"
#import "JKBannerItem.h"
#import "JKContentdetail.h"
#define PADDING 15.0


@interface JKfind ()<UIScrollViewDelegate,TYCyclePagerViewDataSource, TYCyclePagerViewDelegate,JKRecomanddelegate>

@property (nonatomic, strong) UIView *headtitle;
@property (nonatomic, strong) UIView *headScrollview;


@property (nonatomic, strong) UIScrollView *bottomScrollView;
@property (nonatomic, strong) UIScrollView *segmentScrollView;
@property (nonatomic, strong) UIView *segmentbackground;
@property (nonatomic, strong) TYCyclePagerView *pagerView;
@property (nonatomic, strong) TYPageControl *pageControl;
@property (nonatomic, strong) NSArray *Bannerdatas;
//存放控制器
@property(nonatomic,strong)NSMutableArray *controlleres;
//存放TableView
@property(nonatomic,strong)NSMutableArray *tableViews;
//存放button
@property(nonatomic,strong)NSMutableArray *titleButtons;
//记录上一个button
@property (nonatomic, strong) UIButton *previousButton;

@property (nonatomic, strong) UITableView *currentTableView;
//记录上一个偏移量
@property (nonatomic, assign) CGFloat lastTableViewOffsetY;



@end

@implementation JKfind
-(void)setCategoryArr1:(NSMutableArray *)categoryArr1
{
    
    if (_categoryArr1 != categoryArr1) {
        _categoryArr1 = categoryArr1;
    }
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
     JKLog(@"%@",_categoryArr1[0]);
    
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    JKLog(@"%@",_categoryArr1[0]);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createview];
    [self loaddata];
    // Do any additional setup after loading the view.
}
- (void)loaddata {
   
    NSMutableArray *imageMutableArray = [NSMutableArray array];
    for (int i = 1; i<9; i++) {
        NSString *imageName = [NSString stringWithFormat:@"cycle_%02d.jpg",i];
        [imageMutableArray addObject:imageName];
    }
    _Bannerdatas = [imageMutableArray copy];
    _pageControl.numberOfPages = _Bannerdatas.count;
    [_pagerView reloadData];
    //[_pagerView scrollToItemAtIndex:3 animate:YES];
}
-(void)createview
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    _categoryArr = [NSMutableArray arrayWithObjects:@"热门推荐",@"我的关注",@"区块链",@"证券",@"添加", nil];
    self.titleButtons = [[NSMutableArray alloc] initWithCapacity:_categoryArr.count];
    self.controlleres = [[NSMutableArray alloc] initWithCapacity:_categoryArr.count];
    self.tableViews = [[NSMutableArray alloc] initWithCapacity:_categoryArr.count];
    [self.view addSubview:self.bottomScrollView];
   
    [self.view addSubview:self.headScrollview];
     [self.view addSubview:self.headtitle];
    [self.segmentbackground addSubview:self.segmentScrollView];
    [self.view addSubview:self.segmentbackground];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{

    UITableView *tableView = (UITableView *)object;
    
    
    if (!(self.currentTableView == tableView)) {
        return;
    }
    
    if (![keyPath isEqualToString:@"contentOffset"]) {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        return;
    }
    
    
    CGFloat tableViewoffsetY = tableView.contentOffset.y;
    
    self.lastTableViewOffsetY = tableViewoffsetY;
    JKLog(@"%f",tableViewoffsetY);
    if ( tableViewoffsetY>=0 && tableViewoffsetY<=364) {
        
        self.segmentbackground.frame = CGRectMake(0, 427-tableViewoffsetY, WIDGHT, 48);
        self.headScrollview.frame = CGRectMake(0, 64-tableViewoffsetY, WIDGHT, 364);
        
    }else if( tableViewoffsetY < 0){
        
        self.segmentbackground.frame = CGRectMake(0, 427, WIDGHT, 48);
        self.headScrollview.frame = CGRectMake(0, 64, WIDGHT, 364);
        
    }else if (tableViewoffsetY > 364){
        
        self.segmentbackground.frame = CGRectMake(0, 64, WIDGHT, 48);
       self.headScrollview.frame = CGRectMake(0,  64-tableViewoffsetY, WIDGHT, 364);
    }
}

#pragma mark scroolview delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView !=self.bottomScrollView) {
        return ;
    }
    
    int index =  scrollView.contentOffset.x/scrollView.frame.size.width;
    
    UIButton *currentButton = self.titleButtons[index];
    _previousButton.selected = NO;
    currentButton.selected = YES;
    _previousButton = currentButton;
     self.currentTableView  = self.tableViews[index];
    for (UITableView *tableView in self.tableViews) {
        
        if ( self.lastTableViewOffsetY>=0 &&  self.lastTableViewOffsetY<=364) {
            
            tableView.contentOffset = CGPointMake(0,  self.lastTableViewOffsetY);
            
        }else if(  self.lastTableViewOffsetY < 0){
            
            tableView.contentOffset = CGPointMake(0, 0);
            
        }else if ( self.lastTableViewOffsetY > 364){
            
            tableView.contentOffset = CGPointMake(0, 364);
        }
        
    }
    [UIView animateWithDuration:0.3 animations:^{
        if (index == 0) {
            
            
            
        }else{
            
            
            UIButton *preButton = self.titleButtons[index - 1];
            
            float offsetX = CGRectGetMinX(preButton.frame)-PADDING*2;
            
            [self.segmentScrollView scrollRectToVisible:CGRectMake(offsetX, 0, self.segmentScrollView.frame.size.width, self.segmentScrollView.frame.size.height) animated:YES];
            
         
        }
        
    }];
}

#pragma mark 标题点击事件
-(void)changeSelectedItem:(UIButton *)currentButton
{
    _previousButton.selected = NO;
    currentButton.selected = YES;
    _previousButton = currentButton;
    NSInteger index = [self.titleButtons indexOfObject:currentButton];
    self.currentTableView  = self.tableViews[index];
    for (UITableView *tableView in self.tableViews) {
        
        if ( self.lastTableViewOffsetY>=0 &&  self.lastTableViewOffsetY<=136) {
            
            tableView.contentOffset = CGPointMake(0,  self.lastTableViewOffsetY);
            
        }else if(self.lastTableViewOffsetY < 0){
            
            tableView.contentOffset = CGPointMake(0, 0);
            
        }else if ( self.lastTableViewOffsetY > 136){
            
            tableView.contentOffset = CGPointMake(0, 136);
        }
    }
    [UIView animateWithDuration:0.3 animations:^{
        
        if (index == 0) {
            
           
            
        }else{
            
            
            UIButton *preButton = self.titleButtons[index - 1];
            
            float offsetX = CGRectGetMinX(preButton.frame)-PADDING*2;
            
            [self.segmentScrollView scrollRectToVisible:CGRectMake(offsetX, 0, self.segmentScrollView.frame.size.width, self.segmentScrollView.frame.size.height) animated:YES];
            
           
        }
        self.bottomScrollView.contentOffset = CGPointMake(WIDGHT *index, 0);
        
    }];
    
    
    
}
#pragma mark 点击事件
-(void)editAction{
    JKPublishState *vc= [[JKPublishState alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
    
}
-(void)searchAct{
    
}
-(void)addhannel
{
    JKchannel *vc= [[JKchannel alloc]init];
    [self presentViewController:vc animated:YES completion:^{
        
        
    }];
    
}

#pragma mark 懒加载
-(UIView *)headtitle
{
    if (!_headtitle) {
        _headtitle = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDGHT, 64)];
        UIImageView * img = [[UIImageView alloc]initWithFrame:CGRectMake(35/widthreal,60/heightreal , 238/2, 50/2)];
        _headtitle.backgroundColor = [UIColor whiteColor];
        img.image = kLGetImage(@"logo");
        [_headtitle addSubview:img];
        UIImageView * img2 = [[UIImageView alloc]initWithFrame:CGRectMake(WIDGHT -40,65/heightreal , 20, 20)];
        img2.image = kLGetImage(@"编辑图标");
        img2.userInteractionEnabled = YES;
        [_headtitle addSubview:img2];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(editAction)];
        [img2 addGestureRecognizer:tap];
        
        
        
    }
    return _headtitle;
}
-(UIView *)headScrollview
{
    if (!_headScrollview) {
        _headScrollview = [[UIView alloc]initWithFrame:CGRectMake(0, 64, WIDGHT, 364)];
//        _headScrollview.backgroundColor =randomColor;
        UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(35/widthreal , 55/heightreal, WIDGHT, 50/heightreal)];
         title.text = @"Hey , 用户名";
         title.font =[UIFont boldSystemFontOfSize:18];
         title.textColor = UIColorFromRGB(0x333333) ;
         [_headScrollview addSubview:title];
        UILabel *title2 = [[UILabel alloc]initWithFrame:CGRectMake(35/widthreal ,title.frame.size.height+title.frame.origin.y + 13/heightreal, WIDGHT, 50/heightreal)];
        title2.text = @"欢迎来到鱼头社交";
        title2.font =[UIFont boldSystemFontOfSize:18];
        title2.textColor = UIColorFromRGB(0x333333) ;
        [_headScrollview addSubview:title2];
        
        UIImageView * img = [[UIImageView alloc]initWithFrame:CGRectMake(19/widthreal,title2.frame.size.height+title2.frame.origin.y + 33/heightreal ,712/widthreal, 122/heightreal)];
        img.image = kLGetImage(@"搜索");
        img.userInteractionEnabled = YES;
        [_headScrollview addSubview:img];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(searchAct)];
        [img addGestureRecognizer:tap];
        
        
        
       
        
        TYCyclePagerView *pagerView = [[TYCyclePagerView alloc]init];
        pagerView.frame =CGRectMake(0, img.frame.size.height+img.frame.origin.y + 63/heightreal, WIDGHT, 330/heightreal);
       
        pagerView.isInfiniteLoop = YES;
        pagerView.autoScrollInterval = 3.0;
        pagerView.dataSource = self;
        pagerView.delegate = self;
        // registerClass or registerNib
        [pagerView registerClass:[JKBannerItem class] forCellWithReuseIdentifier:@"cellId"];
        [_headScrollview addSubview:pagerView];
        _pagerView = pagerView;
        TYPageControl *pageControl = [[TYPageControl alloc]init];
        pageControl.frame = CGRectMake(0, CGRectGetHeight(_pagerView.frame) - 26, CGRectGetWidth(_pagerView.frame), 26);
        //pageControl.numberOfPages = _datas.count;
        pageControl.currentPageIndicatorSize = CGSizeMake(6, 6);
        pageControl.pageIndicatorSize = CGSizeMake(12, 6);
        pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        pageControl.pageIndicatorTintColor = [UIColor grayColor];
        //    pageControl.pageIndicatorImage = [UIImage imageNamed:@"Dot"];
        //    pageControl.currentPageIndicatorImage = [UIImage imageNamed:@"DotSelected"];
        //    pageControl.contentInset = UIEdgeInsetsMake(0, 20, 0, 20);
        //    pageControl.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
        //    pageControl.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        //    [pageControl addTarget:self action:@selector(pageControlValueChangeAction:) forControlEvents:UIControlEventValueChanged];
        [_pagerView addSubview:pageControl];
        _pageControl = pageControl;
        
        
    }
    return _headScrollview;
}

-(UIScrollView *)bottomScrollView
{
    if (!_bottomScrollView) {
        _bottomScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, WIDGHT,HEIGHT )];
        _bottomScrollView.delegate =self;
        _bottomScrollView.backgroundColor = randomColor;
        _bottomScrollView.pagingEnabled =YES;
        for (int i =0; i < _categoryArr.count; i++) {
            JKRecomand *tableviewvc = [[JKRecomand alloc]init];
            tableviewvc.delegate = self;
            tableviewvc.view.frame = CGRectMake(WIDGHT * i, 0, WIDGHT, HEIGHT);
            tableviewvc.view.backgroundColor = randomColor;
            [self.bottomScrollView addSubview:tableviewvc.view];
            [self.controlleres addObject:tableviewvc];
            [self.tableViews addObject:tableviewvc.tableView];
             NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
              [tableviewvc.tableView addObserver:self forKeyPath:@"contentOffset" options:options context:nil];
        }
        self.currentTableView = self.tableViews[0];
        self.bottomScrollView.contentSize = CGSizeMake(self.controlleres.count * WIDGHT, 0);
    }
    
    return _bottomScrollView;
}
-(UIScrollView *)segmentScrollView{
    if (!_segmentScrollView) {
        _segmentScrollView =  [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDGHT-35, 48)];
       
        _segmentScrollView.showsHorizontalScrollIndicator = NO;
        _segmentScrollView.showsVerticalScrollIndicator = NO;
        _segmentScrollView.backgroundColor = [UIColor whiteColor];
        NSInteger btnoffset = 0;
        for (int i = 0; i<_categoryArr.count; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setTitle:_categoryArr[i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
            [btn setTitleColor:UIColorFromRGB(themeColor) forState:UIControlStateSelected];
            btn.titleLabel.font = [UIFont systemFontOfSize:16];
            CGSize size = [UIButton sizeOfLabelWithCustomMaxWidth:WIDGHT systemFontSize:16.0 andFilledTextString:_categoryArr[i]];
            
            
            float originX =  i? PADDING*2+btnoffset:PADDING;
            
            btn.frame = CGRectMake(originX, 14, size.width, size.height);
            btnoffset = CGRectGetMaxX(btn.frame);
            
            
            btn.titleLabel.textAlignment = NSTextAlignmentLeft;
            [btn addTarget:self action:@selector(changeSelectedItem:) forControlEvents:UIControlEventTouchUpInside];
            [_segmentScrollView addSubview:btn];
            
            [self.titleButtons addObject:btn];
            
            //contentSize 等于按钮长度叠加
            //默认选中第一个按钮
            if (i == 0) {
                
                btn.selected = YES;
                _previousButton = btn;
                
//                _currentSelectedItemImageView.frame = CGRectMake(PADDING, self.segmentScrollView.frame.size.height - 2, btn.frame.size.width, 2);
            }
        }
        
        _segmentScrollView.contentSize = CGSizeMake(btnoffset+PADDING, 25);
    }
     return _segmentScrollView;
}

-(UIView *)segmentbackground
{
    if (!_segmentbackground) {
        _segmentbackground =[[UIView alloc]initWithFrame:CGRectMake(0, 427, WIDGHT, 48)];
//        _segmentbackground.backgroundColor = randomColor;
        _segmentbackground.userInteractionEnabled =YES;
        UIImageView *img = [[UIImageView alloc]init];
        img.frame =CGRectMake(self.segmentScrollView.frame.size.width + self.segmentScrollView.frame.origin.x, 14, 16, 16);
        img.image = kLGetImage(@"添加");
        img.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(addhannel)];
        [img addGestureRecognizer:tap];
        [_segmentbackground addSubview:img];
    }
    return _segmentbackground;
}

#pragma mark - TYCyclePagerViewDataSource

- (NSInteger)numberOfItemsInPagerView:(TYCyclePagerView *)pageView {
    return _Bannerdatas.count;
}

- (UICollectionViewCell *)pagerView:(TYCyclePagerView *)pagerView cellForItemAtIndex:(NSInteger)index {
    JKBannerItem *cell = [pagerView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndex:index];
    cell.backgroundColor = randomColor;
    cell.layer.cornerRadius =5;
    cell.layer.masksToBounds =YES;
    cell.img.image = kLGetImage(_Bannerdatas[index]);
    return cell;
}

- (TYCyclePagerViewLayout *)layoutForPagerView:(TYCyclePagerView *)pageView {
    TYCyclePagerViewLayout *layout = [[TYCyclePagerViewLayout alloc]init];
    layout.itemSize = CGSizeMake(580/widthreal, 330/heightreal);
    layout.itemSpacing = 15;
    layout.layoutType=TYCyclePagerTransformLayoutLinear;
    //layout.minimumAlpha = 0.3;
    return layout;
}

- (void)pagerView:(TYCyclePagerView *)pageView didScrollFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
    _pageControl.currentPage = toIndex;
    //[_pageControl setCurrentPage:newIndex animate:YES];
    NSLog(@"%ld ->  %ld",fromIndex,toIndex);
}

#pragma mark table点击事件
-(void)tableviewdidSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    JKContentdetail *vc = [[JKContentdetail alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}








@end


