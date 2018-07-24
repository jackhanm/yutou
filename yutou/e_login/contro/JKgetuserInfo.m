//
//  JKgetuserInfo.m
//  yutou
//
//  Created by 余浩 on 2018/7/20.
//  Copyright © 2018年 jack. All rights reserved.
//

#import "JKgetuserInfo.h"

@interface JKgetuserInfo ()<UITextFieldDelegate>
@property(nonatomic, retain)UIImageView *backimage;
@property(nonatomic, retain)UILabel *subtitlelabel;
@property(nonatomic, retain)UILabel *noticelable;
@property(nonatomic, retain)UILabel *namelabel;
@property(nonatomic, retain)UITextField *namefield;
@property(nonatomic, retain)UIView *namebotline;
@property(nonatomic, retain)UILabel *sexlable;
@property(nonatomic, retain)UIView  *manChoose;
@property(nonatomic, retain)UIView  *womanChoose;
@property(nonatomic, retain)UIButton *startbt;
@property(nonatomic, retain)UIImageView *manImg;
@property(nonatomic, retain)UILabel *manlabel;
@property(nonatomic, retain)UIImageView *womanImg;
@property(nonatomic, retain)UILabel *womanlabel;
@end

@implementation JKgetuserInfo

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    [self createview];
    // Do any additional setup after loading the view.
}
-(void)createview
{
    _backimage = [[UIImageView alloc]initWithFrame:CGRectMake((37)/widthreal, (74)/heightreal, 19,15)];
    _backimage.image = kLGetImage(@"返回上一页面");
    _backimage.userInteractionEnabled =YES;
    
    _subtitlelabel =[[UILabel alloc]initWithFrame:CGRectMake(63/widthreal, 244/heightreal, (WIDGHTSCALE -130)/widthreal, 90/heightreal)];
    _subtitlelabel.text = @"完善信息";
    _subtitlelabel.textColor = UIColorFromRGB(0x333333);
    _subtitlelabel.font = [UIFont systemFontOfSize:32.0];
    
    _noticelable =[[UILabel alloc]initWithFrame:CGRectMake(63/widthreal, 361/heightreal, WIDGHT -63/widthreal , 45/heightreal)];
    _noticelable.text = @"请让我茫茫人海中一眼看到你";
    _noticelable.textColor = UIColorFromRGB(0x999999);
    _noticelable.font = [UIFont systemFontOfSize:16.0];
    
    _namelabel =[[UILabel alloc]initWithFrame:CGRectMake(63/widthreal, 475/heightreal, (461)/widthreal, 45/heightreal)];
    _namelabel.text = @"取个让人侧目的昵称";
    _namelabel.textColor = UIColorFromRGB(0x333333);
    _namelabel.font = [UIFont systemFontOfSize:14.0];
    
    
    _namefield = [[UITextField alloc]initWithFrame:CGRectMake(63/widthreal, 552/heightreal, (461)/widthreal, 45/heightreal)];
    _namefield.placeholder = @"请输入1-12位汉字/字母/数字";
    _namefield.borderStyle = UITextBorderStyleNone;
    _namefield.delegate =self;
    _namefield.returnKeyType = UIReturnKeyDone;
    _namebotline = [[UIView alloc]initWithFrame:CGRectMake(63/widthreal, 619/heightreal, (621)/widthreal, 3/heightreal)];
    _namebotline.backgroundColor = UIColorFromRGB(0xdcdcdc);
    
    
    _sexlable =[[UILabel alloc]initWithFrame:CGRectMake(63/widthreal, 689/heightreal, (461)/widthreal, 45/heightreal)];
    _sexlable.text = @"小鱼该叫你 先生 还是 女士";
    _sexlable.textColor = UIColorFromRGB(0x333333);
    _sexlable.font = [UIFont systemFontOfSize:14.0];
    
    _manChoose = [[UIView alloc]initWithFrame:CGRectMake(63/widthreal, 764/heightreal, 70, 42/heightreal)];
//    _manChoose.backgroundColor = [UIColor redColor];
    
    _manImg = [[UIImageView alloc]initWithFrame:CGRectMake(0/widthreal, 7/heightreal, (27)/widthreal, 28/heightreal)];
    _manImg.image = kLGetImage(@"男-选中");
    [_manChoose addSubview:_manImg];
    
    _manlabel = [[UILabel alloc]initWithFrame:CGRectMake(56/widthreal, 0/heightreal, (100)/widthreal, 42/heightreal)];
    _manlabel.text = @"先生";
    _manlabel.textColor = UIColorFromRGB(0x666666);
    _manlabel.font = [UIFont systemFontOfSize:15.0];
    [_manChoose addSubview:_manlabel];
    
    _womanChoose = [[UIView alloc]initWithFrame:CGRectMake(300/widthreal, 764/heightreal, 70, 42/heightreal)];
    _womanChoose.userInteractionEnabled = YES;
//    _womanChoose.backgroundColor = [UIColor redColor];
    
    _womanImg = [[UIImageView alloc]initWithFrame:CGRectMake(0/widthreal, 7/heightreal, (27)/widthreal, 28/heightreal)];
    _womanImg.image = kLGetImage(@"女-未选中");
    [_womanChoose addSubview:_womanImg];
    
    _womanlabel = [[UILabel alloc]initWithFrame:CGRectMake(56/widthreal, 0/heightreal, (100)/widthreal, 42/heightreal)];
    _womanlabel.text = @"女士";
    _womanlabel.textColor = UIColorFromRGB(0x999999);
    _womanlabel.font = [UIFont systemFontOfSize:15.0];
    [_womanChoose addSubview:_womanlabel];
    
    
    UIView *sexbotview = [[UIView alloc]initWithFrame:CGRectMake(63/widthreal, 829/heightreal, (621)/widthreal, 3/heightreal)];
    sexbotview.backgroundColor = UIColorFromRGB(0xdcdcdc);
    
    _startbt = [UIButton buttonWithType:UIButtonTypeCustom];
    _startbt.frame = CGRectMake(65/widthreal, sexbotview.frame.size.height+sexbotview.frame.origin.y+ 64/heightreal, 620/widthreal, 98/heightreal);
    _startbt.backgroundColor = UIColorFromRGB(themeColor);
    _startbt.layer.masksToBounds = YES;
    _startbt.layer.cornerRadius = _startbt.frame.size.height/2;
    [_startbt setTitle:@"开 启 鱼 头 之 旅" forState:UIControlStateNormal];
    [_startbt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_startbt addTarget:self action:@selector(startbtAct) forControlEvents:UIControlEventTouchUpInside];

    
    //添加页面
    UIView *view =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    [view addSubview:_backimage];
    
    
    [self.view addSubview:view];
    
    [self.view addSubview:_subtitlelabel];
     [self.view addSubview:_noticelable];
    [self.view addSubview:_namelabel];
    [self.view addSubview:_namefield];
    [self.view addSubview:_namebotline];
    [self.view addSubview:_sexlable];
    [self.view addSubview:_manChoose];
    [self.view addSubview:_womanChoose];
    [self.view addSubview:sexbotview];
    [self.view addSubview:_startbt];
    
    //添加手势
    UITapGestureRecognizer *backtap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backtapAct)];
    [view addGestureRecognizer:backtap];
    
    UITapGestureRecognizer *mantap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(mantapAct)];
    [_manChoose addGestureRecognizer:mantap];
    
    UITapGestureRecognizer *womantap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(womantapAct)];
    [_womanChoose addGestureRecognizer:womantap];
    
    UITapGestureRecognizer *pagetap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(pagetapAct)];
    [self.view addGestureRecognizer:pagetap];
    
    
}
-(void)startbtAct
{
    JKLog(@"regist");
    _Regist();
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];    //主要是[receiver resignFirstResponder]在哪调用就能把receiver对应的键盘往下收
    return YES;
    
}
-(void)mantapAct{
    JKLog(@"先生");
    _womanImg.image = kLGetImage(@"女-未选中");
    _womanlabel.textColor =UIColorFromRGB(0x999999);
    _manImg.image = kLGetImage(@"男-选中");
     _manlabel.textColor = UIColorFromRGB(0x666666);
}
-(void)womantapAct{
    JKLog(@"女生");
    _womanImg.image = kLGetImage(@"女-选中");
    _womanlabel.textColor =UIColorFromRGB(0x666666);
    _manImg.image = kLGetImage(@"男-未选中");
    _manlabel.textColor = UIColorFromRGB(0x999999);
    
}
-(void)pagetapAct{
    [self.view endEditing:YES];
    
}
-(void)backtapAct
{
    [self.navigationController popViewControllerAnimated:YES];
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
