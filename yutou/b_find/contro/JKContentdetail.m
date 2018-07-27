
//
//  JKContentdetail.m
//  yutou
//
//  Created by 余浩 on 2018/7/27.
//  Copyright © 2018年 jack. All rights reserved.
//

#import "JKContentdetail.h"
#import "JKRecomandcell.h"
#import "JKRecomandModel.h"
@interface JKContentdetail ()<UITableViewDelegate,UITableViewDataSource,UIWebViewDelegate>
@property (nonatomic, strong) NSMutableArray *modelArray;
@property (nonatomic, strong) UIViewController *controller;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) UIView *titleView;
@property (nonatomic, strong) UIView *authorView;
@property(nonatomic, strong)UILabel *titleLabel ;
@property (nonatomic, strong) UIImageView *userPhoto;
@property (nonatomic, strong) UIImageView *likeimg;
@property(nonatomic, strong)UILabel *authorLabel ;
@property(nonatomic, strong)UILabel *timeLabel ;
@property(nonatomic, strong) UIView *tableHeaderView;
//记录上一个偏移量
@property (nonatomic, assign) CGFloat lastTableViewOffsetY;
@end

@implementation JKContentdetail

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createview];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden =YES;
    [self loadData];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden =NO;
}
-(void)createview
{
    [self.view addSubview:self.tableView];
     UIView *headview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDGHT, 272/heightreal)];
    headview.backgroundColor = [UIColor whiteColor];
    
    self.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,  WIDGHT, HEIGHT)];
    self.tableHeaderView.backgroundColor = [UIColor whiteColor];
    [self.tableHeaderView addSubview:headview];
    [self.tableHeaderView addSubview:self.webView];
     self.tableView.tableHeaderView = self.tableHeaderView;
    [self.view addSubview:self.titleView];
    [self.view addSubview:self.authorView];
   
    NSString *strHTML =@"<p style=\"text-indent: 2em;\">11月5日，第11届中国(深圳)国际金融博览会正式开幕，本次展览持续四天。这场中国金融业的年度盛会，吸引了大批业内人士的关注，金融界各领域实力机构及企业都携各自的亮点登上了这个舞台。银都控股在本次金博会上也大放异彩。</p><p style=\"text-indent: 2em;\"><br/></p><p style=\"text-align: center;\"><img src=\"https://indu.oss-cn-hangzhou.aliyuncs.com/upload/image/20180327/1522121407775086614.png?OSSAccessKeyId=LTAI1vKjpL6YLl6d&Signature=XF7yyUyVCYakVIV9Bixjjh3Iu3Q%3D&Expires=1837481407\" title=\"1522121407775086614.png\" alt=\"blob.png\"/></p><p><br/></p><p>　　深圳金博会自2007年首次举办以来已经成功举办10届，在促进深圳金融业创新发展、搭建国际金融交流合作平台方面发挥了重要作用。深圳金博会已成为国内三大金融展之一，本次展会涵盖近300家银行、证券、保险、互联网金融、基金、投融资等机构，参展商均为行业内知名企业，参观者近十万人，深受深圳市政府领导以及多家媒体的关注。</p><p><br/></p><p style=\"text-align: center;\"><img src=\"https://indu.oss-cn-hangzhou.aliyuncs.com/upload/image/20180327/1522121428727027319.png?OSSAccessKeyId=LTAI1vKjpL6YLl6d&Signature=6ZdhCvmn1WVu4%2B6fyMUpAsdvV70%3D&Expires=1837481428\" title=\"1522121428727027319.png\" alt=\"blob.png\"/></p><p><br/></p><p>　　银都控股在现场集中展示其金融品牌布局，亮相金博会即获得极大关注，公众对银都控股的智慧金融生态圈有了更进一步的了解，银都金融生态价值得到更好凸显，作为一家全国性的金融集团公司，始终坚持从投资人的角度出发，为投资人提供财富管理、资产配置、金融资本等一站式投融资管理服务。自公司创立之日起，秉承“匠心”精神，深度结合市场需求，所发行产品均取得丰厚的投资收益回报。</p><p><br/></p><p style=\"text-align: center;\"><img src=\"https://indu.oss-cn-hangzhou.aliyuncs.com/upload/image/20180327/1522121449333098183.png?OSSAccessKeyId=LTAI1vKjpL6YLl6d&Signature=ftmJiSb6Nh8sntu%2BqCc5Ccm%2Fioo%3D&Expires=1837481449\" title=\"1522121449333098183.png\" alt=\"blob.png\"/></p><p><br/></p><p>　　银都控股结合近期的品牌战略升级，展会上将向公众展示银都控股全新的品牌形象，彰显“大国金融·智慧银都”的品牌气魄，相信大家会对银都品牌、旗下产业版块以及银都所倡导的价值观及投资理念等，有更全面深入的了解。</p><p><br/></p><p>　　“大国金融·智慧银都”这个主题一经推出，深受观展人员和记者媒体的青睐，不仅展现了银都控股致力于打造智慧金融生态圈的实力，更传递了银都控股携手投资人、合作伙伴开创专属银都的“大国金融”时代的决心。银都金融航母梦，已然起航!</p><p><br/></p>";
    [_webView loadHTMLString:strHTML baseURL:nil];
    [_webView.scrollView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:nil];
   
}
- (void)loadData {
    
    for (unsigned long i = 0; i<10; i++) {
        JKRecomandModel *model = [[JKRecomandModel alloc] init];
        
        model.title = @"jack";
        [self.modelArray addObject:model];
        
    }
    
    [self.tableView reloadData];
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.modelArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    cell.backgroundColor =randomColor;
   
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
}

- (UITableView *)tableView {
    if (!_tableView) {
        
        _tableView  = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDGHT, HEIGHT)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];
         NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
        [_tableView addObserver:self forKeyPath:@"contentOffset" options:options context:nil];
    }
    return _tableView;
}

- (NSMutableArray *)modelArray {
    if (!_modelArray) {
        
        _modelArray = [NSMutableArray array];
    }
    return _modelArray;
}
-(UIWebView *)webView
{
    if (!_webView) {
        _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 272/heightreal, WIDGHT, HEIGHT -272/heightreal)];
        _webView.scrollView.scrollEnabled = NO;
        _webView.delegate = self;
        
    }
    return _webView;
}
-(UIView *)titleView
{
    if (!_titleView) {
        _titleView =  [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDGHT,136/heightreal)];
        _titleLabel = [[UILabel alloc]initWithFrame:_titleView.frame];
        _titleLabel.font = [UIFont systemFontOfSize:45/2];
        _titleLabel.textColor = UIColorFromRGB(0x333333);
        _titleLabel.numberOfLines =2;
        _titleView.backgroundColor =randomColor;
        
    }
    return _titleView;
}
-(UIView *)authorView
{
    if (!_authorView) {
        _authorView =  [[UIView alloc]initWithFrame:CGRectMake(0, 136/heightreal, WIDGHT,136/heightreal)];
         _authorView.backgroundColor =randomColor;
        _userPhoto = [[UIImageView alloc]initWithFrame:CGRectMake(35/widthreal, 50/heightreal, 78/widthreal,78/heightreal)];
        _userPhoto.layer.cornerRadius =_userPhoto.frame.size.height/2;
        _userPhoto.backgroundColor =randomColor;
        [_authorView addSubview:_userPhoto];
        _authorLabel = [[UILabel alloc]initWithFrame:CGRectMake(_userPhoto.frame.size.width+_userPhoto.frame.origin.x+10, 50/heightreal, 432/widthreal,43/heightreal)];
        _authorLabel.font = [UIFont systemFontOfSize:45/2];
        _authorLabel.textColor = UIColorFromRGB(0x333333);
        _authorLabel.numberOfLines =1;
        _authorLabel.backgroundColor =randomColor;
        [_authorView addSubview:_authorLabel];
        _timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(_userPhoto.frame.size.width+_userPhoto.frame.origin.x+10, 50/heightreal + _authorLabel.frame.size.height, 432/widthreal,33/heightreal)];
        _timeLabel.font = [UIFont systemFontOfSize:45/2];
        _timeLabel.textColor = UIColorFromRGB(0x333333);
        _timeLabel.numberOfLines =1;
        _timeLabel.backgroundColor =randomColor;
        _likeimg = [[UIImageView alloc]initWithFrame:CGRectMake(WIDGHT- 176/widthreal, 59/heightreal, 140/widthreal,60/heightreal)];
        _likeimg.layer.cornerRadius =_likeimg.frame.size.height/2;
        _likeimg.backgroundColor =randomColor;
        [_authorView addSubview:_likeimg];
    }
    return _authorView;
}


#pragma mark kvo
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    
    CGFloat tableViewoffsetY = self.tableView.contentOffset.y;
    
    self.lastTableViewOffsetY = tableViewoffsetY;
    JKLog(@"%f",tableViewoffsetY);
    if ( tableViewoffsetY>=0 && tableViewoffsetY<=136/heightreal) {
        
//        self.authorView.frame = CGRectMake(0, 136/heightreal-tableViewoffsetY, WIDGHT, 136/heightreal);
      
        
    }else if( tableViewoffsetY < 0){
        
//        self.authorView.frame = CGRectMake(0, 0, WIDGHT, 136/heightreal);
       
        
    }else if (tableViewoffsetY > 136/heightreal){
        
//        self.authorView.frame = CGRectMake(0, 136/heightreal-tableViewoffsetY, WIDGHT, 136/heightreal);
        
    }
}
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    CGFloat contentHeight = [webView stringByEvaluatingJavaScriptFromString:@"document.body.scrollHeight;"].floatValue;
    CGRect frame = webView.frame;
    frame.size.height = contentHeight ;
    webView.frame = frame;
    UIView *headview = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDGHT, frame.size.height+272/heightreal)];
    
    self.tableHeaderView.frame = CGRectMake(0, 0, WIDGHT, frame.size.height+272/heightreal);
    self.tableView.tableHeaderView =  self.tableHeaderView;
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
