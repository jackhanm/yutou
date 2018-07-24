//
//  JKenter.m
//  yutou
//
//  Created by 余浩 on 2018/7/5.
//  Copyright © 2018年 jack. All rights reserved.
//

#import "JKenter.h"
#import "JKlogin.h"
#import "JKgetcode.h"
@interface JKenter ()<UITextFieldDelegate>
{
    void(^_myBlock)(void);
}
@property(nonatomic, retain)UIImageView *headimage;
@property(nonatomic, retain)UILabel *titlelabel;
@property(nonatomic, retain)UILabel *subtitlelabel;
@property(nonatomic, retain)UIButton *loginbt;
@property(nonatomic, retain)UIButton *registbt;
@property(nonatomic, retain)UIImageView *closeimage;
@property(nonatomic, retain)UIButton *registitlebt;
@property(nonatomic, retain)UIButton *logintitlebt;
@property(nonatomic, retain)UIView *box1;
@property(nonatomic, retain)UIImageView *nameimage;
@property(nonatomic, retain)UITextField *namefield;
@property(nonatomic, retain)UILabel *namelabel;
@property(nonatomic, retain)UIView *namebotline;
@property(nonatomic, retain)UIImageView *pwdimage;
@property(nonatomic, retain)UITextField *pwdfield;
@property(nonatomic, retain)UILabel *pwdlabel;
@property(nonatomic, retain)UIView *pwdbotline;
@property(nonatomic, retain)UIButton *nextbt;
@property(nonatomic, retain)UILabel *registknown;
@property(nonatomic, retain)UILabel *forgetlabel;
@property(nonatomic, retain)UIButton *eyebt;
@property(nonatomic, assign)BOOL openeye;
@property(nonatomic, retain)UIView *SkipView;
@property (nonatomic, strong) UISwipeGestureRecognizer *leftSwipeGestureRecognizer;
@property (nonatomic, strong) UISwipeGestureRecognizer *rightSwipeGestureRecognizer;
@end

@implementation JKenter


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    StatuBarLight;
    _openeye= YES;
    self.view.backgroundColor =[UIColor whiteColor];
    [self createview];
    self.leftSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    self.rightSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    self.leftSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    self.rightSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:self.leftSwipeGestureRecognizer];
    [self.view addGestureRecognizer:self.rightSwipeGestureRecognizer];
    // Do any additional setup after loading the view.
}
-(void)loginblock:(void (^)(void))block
{
     _myBlock = block;
}
- (void)handleSwipes:(UISwipeGestureRecognizer *)sender

{
    
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft) {
        JKLog(@"往左滑动");
    
        if (_logintitlebt.hidden) {
            
        }else{
             [self loginSkipAct];
        }
       
    }
    
    
    
    if (sender.direction == UISwipeGestureRecognizerDirectionRight) {
           JKLog(@"往右滑动");
        if (_logintitlebt.hidden) {
            
        }else{
             [self registerSkipAct];
        }
       
    }
    
}

-(void)createview{
    //页面较简单直接写vc
    UIImageView *backimage = [[UIImageView alloc]initWithFrame:self.view.frame];
    backimage.image = kLGetImage(@"背景");
    backimage.userInteractionEnabled =YES;
    _headimage =[[UIImageView alloc]initWithFrame:CGRectMake(65/widthreal, 245/heightreal, 154/widthreal, 94/heightreal)];
    _headimage.image = kLGetImage(@"Group");
    
    
    _titlelabel =[[UILabel alloc]initWithFrame:CGRectMake(65/widthreal, 407/heightreal, WIDGHTSCALE -65/widthreal*2 , 73/heightreal)];
    _titlelabel.textColor = [UIColor whiteColor];
    NSMutableAttributedString *hintString=[[NSMutableAttributedString alloc]initWithString:@"欢迎来到鱼头社交"];
    //获取要调整颜色的文字位置,调整颜色
    NSRange range1=[[hintString string]rangeOfString:@"鱼头社交"];
    [hintString addAttribute:NSForegroundColorAttributeName value:UIColorFromRGB(themeColor) range:range1];
    _titlelabel.attributedText=hintString;
    _titlelabel.font = [UIFont systemFontOfSize:32.0];
    
    
    
    _subtitlelabel =[[UILabel alloc]initWithFrame:CGRectMake(65/widthreal, _titlelabel.frame.size.height+_titlelabel.frame.origin.y+ 10/heightreal, 590/widthreal, 50/heightreal)];
    _subtitlelabel.text = @"聚焦去中心化的金融社交网络生态";
    _subtitlelabel.textColor = [UIColor whiteColor];
    _subtitlelabel.font = [UIFont systemFontOfSize:16.0];
    
    JKLog(@"%f",HEIGHTSCALE);
    _loginbt = [UIButton buttonWithType:UIButtonTypeCustom];
    _loginbt.frame = CGRectMake(65/widthreal,_subtitlelabel.frame.size.height+_subtitlelabel.frame.origin.y + 358/heightreal, 620/widthreal, 98/heightreal);
    _loginbt.backgroundColor = UIColorFromRGB(themeColor);
    _loginbt.layer.masksToBounds = YES;
    _loginbt.layer.cornerRadius = _loginbt.frame.size.height/2;
    [_loginbt setTitle:@"立即登录" forState:UIControlStateNormal];
    [_loginbt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_loginbt addTarget:self action:@selector(loginbtAct) forControlEvents:UIControlEventTouchUpInside];
    
    
    _registbt = [UIButton buttonWithType:UIButtonTypeCustom];
    _registbt.frame = CGRectMake(65/widthreal, self.loginbt.frame.origin.y+self.loginbt.frame.size.height+29/heightreal, 620/widthreal, 98/heightreal);
    [_registbt setTitle:@"注册账号" forState:UIControlStateNormal];
    _registbt.layer.masksToBounds = YES;
    _registbt.layer.cornerRadius = _registbt.frame.size.height/2;
    _registbt.layer.borderColor = [[UIColor whiteColor] CGColor];
    _registbt.layer.borderWidth = 1;
    [_registbt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
     [_registbt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_registbt addTarget:self action:@selector(registerAct) forControlEvents:UIControlEventTouchUpInside];
    
    
    UILabel *versionlabel = [[UILabel alloc]initWithFrame:CGRectMake(10, _registbt.frame.size.height+_registbt.frame.origin.y + 158/heightreal, WIDGHT-20, 33/heightreal)];
    versionlabel.textColor = UIColorFromRGBA(0x999999, 1.0);
    versionlabel.textAlignment = NSTextAlignmentCenter;
    versionlabel.font = [UIFont systemFontOfSize:12.0];
    NSString *str = APPVERSION;
    versionlabel.text = [NSString stringWithFormat:@"版本号: v%@",str] ;
    
    //添加view
    [self.view addSubview:backimage];
    [self.view addSubview:_headimage];
    [self.view addSubview:_titlelabel];
    [self.view addSubview:_subtitlelabel];
    [self.view addSubview:_loginbt];
    [self.view addSubview:_registbt];
    [self.view addSubview:versionlabel];
   
    UITapGestureRecognizer *backgroundtap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backgroundtapAct)];
    [backimage addGestureRecognizer:backgroundtap];
    
    UIView *view =[[UIView alloc]initWithFrame:CGRectMake(WIDGHT- 40, (70)/heightreal, 40, 35)];
    _closeimage = [[UIImageView alloc]initWithFrame:CGRectMake(8, 10, 16, 16)];
    _closeimage.image = kLGetImage(@"关闭页面");
    _closeimage.hidden=YES;
    _closeimage.alpha = 0;
    _closeimage.userInteractionEnabled =YES;
    [view addSubview:_closeimage];
    [self.view addSubview:view];
    UITapGestureRecognizer *closetap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(closetapAct)];
    [view addGestureRecognizer:closetap];
   
}

-(void)registerSkipAct
{
    [_registitlebt setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    [_logintitlebt setTitleColor:UIColorFromRGBA(0xffffff,0.62) forState:UIControlStateNormal];
    [self.nextbt setTitle:@"下一步" forState:UIControlStateNormal];
     self.pwdlabel.text = @"请设置您的登录密码";
    self.registknown.hidden = NO;
    self.registknown.alpha =1;
    self.forgetlabel.hidden = YES;
    self.forgetlabel.alpha = 0;
    [UIView animateWithDuration:0.3 animations:^{
        self.SkipView.frame = CGRectMake(61/widthreal, (311)/heightreal,82, 18/heightreal);
    } completion:^(BOOL finished) {
        
    }];
    
}
-(void)loginSkipAct
{
    [_logintitlebt setTitleColor:UIColorFromRGB(0xffffff) forState:UIControlStateNormal];
    [_registitlebt setTitleColor:UIColorFromRGBA(0xffffff,0.62) forState:UIControlStateNormal];
    [self.nextbt setTitle:@"登录" forState:UIControlStateNormal];
     self.pwdlabel.text = @"请输入您的登录密码";
    self.registknown.hidden = YES;
     self.registknown.alpha =0;
    self.forgetlabel.hidden = NO;
     self.forgetlabel.alpha =1;
    [UIView animateWithDuration:0.3 animations:^{
        self.SkipView.frame = CGRectMake(110/widthreal+85, (311)/heightreal, 82, 18/heightreal);
    } completion:^(BOOL finished) {
        
    }];
}
-(void)nextbtAct:(UIButton *)sender
{
    if ([sender.titleLabel.text isEqualToString:@"登录"]) {
        JKLog(@"login");
        _myBlock();
    }{
        JKgetcode *vc =[[JKgetcode alloc]init];
        vc.phoneNum = self.namefield.text;
        vc.goRegist =   _myBlock;
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    
  
}
-(void)closetapAct{
    [UIView animateWithDuration:0.5 animations:^{
        
        self.headimage.alpha = 1;
        self.titlelabel.alpha = 1;
        self.subtitlelabel.alpha = 1;
        self.loginbt.alpha =1;
        self.registbt.alpha = 1;
        
    } completion:^(BOOL finished) {
        self.headimage.hidden = NO;
        self.titlelabel.hidden = NO;
        self.subtitlelabel.hidden = NO;
        self.loginbt.hidden =NO;
        self.registbt.hidden = NO;
        
    }];
    [UIView animateWithDuration:0.5 animations:^{
        
        self.closeimage.alpha = 0;
        self.registitlebt.alpha =0;
        self.logintitlebt.alpha =0;
        self.nameimage.alpha =0;
        self.namelabel.alpha=0;
        self.namebotline.alpha =0;
        self.pwdimage.alpha =0;
        self.pwdlabel.alpha=0;
          self.eyebt.alpha = 0;
        self.pwdbotline.alpha =0;
          self.nextbt.alpha =0;
        self.registknown.alpha =0;
      
      
    } completion:^(BOOL finished) {
        self.closeimage.hidden = YES;
        self.registitlebt.hidden = YES;
        self.logintitlebt.hidden = YES;
         self.SkipView.hidden = YES;
        self.nameimage.hidden =YES;
        self.namelabel.hidden=YES;
        self.namebotline.hidden =YES;
        self.pwdimage.hidden =YES;
        self.pwdlabel.hidden=YES;
          self.eyebt.hidden=YES;
        self.pwdbotline.hidden =YES;
         self.nextbt.hidden = YES;
        self.registknown.hidden =YES;
      self.forgetlabel.hidden =YES;
       
       
        
    }];
}
-(void)backgroundtapAct
{
    if (self.namefield.text.length == 0) {
        [UIView animateWithDuration:0.5 animations:^{
            self.namelabel.frame = CGRectMake((142)/widthreal, (540)/heightreal, 506/widthreal, 48/heightreal);
            self.namelabel.font =[UIFont systemFontOfSize:17];
        } completion:^(BOOL finished) {
            
        }];
    }
    if (self.pwdfield.text.length == 0) {
        [UIView animateWithDuration:0.5 animations:^{
            self.pwdlabel.frame = CGRectMake((142)/widthreal, (678)/heightreal, 506/widthreal, 48/heightreal);
            self.pwdlabel.font =[UIFont systemFontOfSize:17];
        } completion:^(BOOL finished) {
            
        }];
    }
    [self.view endEditing:YES];
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == self.namefield) {
        
        [UIView animateWithDuration:0.5 animations:^{
            self.namelabel.frame = CGRectMake((102)/widthreal, (480)/heightreal, 306/widthreal, 48/heightreal);
            self.namelabel.font =[UIFont systemFontOfSize:14];
        } completion:^(BOOL finished) {
            
        }];
    }
    if (textField == self.pwdfield) {
        
        [UIView animateWithDuration:0.5 animations:^{
            self.pwdlabel.frame = CGRectMake((102)/widthreal, (620)/heightreal, 306/widthreal, 48/heightreal);
            self.pwdlabel.font =[UIFont systemFontOfSize:14];
        } completion:^(BOOL finished) {
            
        }];
    }
    
    
}

-(void)eyebttapAct
{
    if (_openeye) {
        
        _eyebt.frame = CGRectMake(WIDGHT - 65/widthreal -19 , (698)/heightreal, 19, 11);
        [_eyebt setImage:kLGetImage(@"显示密码图标") forState:UIControlStateNormal];
      
        
    }else{
        _eyebt.frame = CGRectMake(WIDGHT - 65/widthreal -19 , (698)/heightreal, 19, 9);
       
         [_eyebt setImage:kLGetImage(@"隐藏密码图标") forState:UIControlStateNormal];
    }
    _openeye = !_openeye;
    _pwdfield.secureTextEntry = _openeye;
}
-(void)annimation{
    [UIView animateWithDuration:0.3 animations:^{
        
        self.headimage.alpha = 0;
        self.titlelabel.alpha = 0;
        self.subtitlelabel.alpha = 0;
        self.loginbt.alpha =0;
        self.registbt.alpha = 0;
        
        
    } completion:^(BOOL finished) {
        self.headimage.hidden = YES;
        self.titlelabel.hidden = YES;
        self.subtitlelabel.hidden = YES;
        self.loginbt.hidden =YES;
        self.registbt.hidden = YES;
        
    }];
    [UIView animateWithDuration:0.5 animations:^{
        
        self.closeimage.alpha = 1;
        self.registitlebt.alpha =1;
        self.logintitlebt.alpha =1;
        self.nameimage.alpha =1;
        self.namelabel.alpha=1;
        self.namebotline.alpha =1;
        self.namefield.alpha = 1;
        self.pwdimage.alpha =1;
        self.pwdlabel.alpha=1;
        self.pwdfield.alpha =1;
        self.pwdbotline.alpha =1;
        self.eyebt.alpha = 1;
        self.nextbt.alpha =1;
        self.registknown.alpha =1;
      
       
    } completion:^(BOOL finished) {
        self.closeimage.hidden = NO;
        self.registitlebt.hidden = NO;
        self.logintitlebt.hidden = NO;
        self.SkipView.hidden = NO;
        self.nameimage.hidden =NO;
        self.namefield.hidden = NO;
        self.namelabel.hidden=NO;
        self.namebotline.hidden =NO;
        self.pwdimage.hidden =NO;
        self.pwdlabel.hidden=NO;
        self.pwdfield.hidden = NO;
        self.pwdbotline.hidden =NO;
        self.eyebt.hidden=NO;
        self.nextbt.hidden = NO;
        self.registknown.hidden =NO;
      
      
        
    }];
}
-(void)registerAct{

    [self annimation];
    [self registerSkipAct];

}
-(void)loginbtAct{
  [self annimation];
    [UIView animateWithDuration:0.3 animations:^{

        self.registknown.alpha = 0;
        
    } completion:^(BOOL finished) {
        
        self.registknown.hidden =YES;
        
    }];
    [UIView animateWithDuration:0.5 animations:^{
        
      
        
        self.forgetlabel.alpha =1;
      
    } completion:^(BOOL finished) {
      

        self.forgetlabel.hidden = NO;
    }];
    [self loginSkipAct];
 
}
#pragma mark 懒加载
-(UIView *)SkipView
{
    if (!_SkipView) {
        _SkipView = [[UIView alloc]initWithFrame:CGRectMake(61/widthreal, (311)/heightreal,82, 18/heightreal)];
        _SkipView.layer.cornerRadius = _SkipView.frame.size.height/2;
        _SkipView.hidden = YES;
        _SkipView.backgroundColor = UIColorFromRGBA(themeColor, 0.8);
        [self.view addSubview:_SkipView];
    }
    return _SkipView;
}
-(UIButton *)registitlebt
{
    if (!_registitlebt) {
        _registitlebt = [UIButton buttonWithType:UIButtonTypeCustom];
        _registitlebt.frame = CGRectMake(78/widthreal, (244)/heightreal, 72, 90/heightreal);
        [_registitlebt setTitle:@"注册" forState:UIControlStateNormal];
        _registitlebt.titleLabel.font = [UIFont systemFontOfSize:32];
        [_registitlebt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_registitlebt addTarget:self action:@selector(registerSkipAct) forControlEvents:UIControlEventTouchUpInside];
        _registitlebt.alpha = 0;
        _registitlebt.hidden = YES;
        [self.view addSubview:_registitlebt];
    }
    return _registitlebt;
}
-(UIButton *)logintitlebt
{
    if (!_logintitlebt) {
        _logintitlebt = [UIButton buttonWithType:UIButtonTypeCustom];
        _logintitlebt.frame = CGRectMake(158/widthreal +72, (244)/heightreal, 72, 90/heightreal);
        [_logintitlebt setTitle:@"登录" forState:UIControlStateNormal];
        _logintitlebt.titleLabel.font = [UIFont systemFontOfSize:32];
        [_logintitlebt setTitleColor:UIColorFromRGBA(0xffffff,0.62) forState:UIControlStateNormal];
        [_logintitlebt addTarget:self action:@selector(loginSkipAct) forControlEvents:UIControlEventTouchUpInside];
        _logintitlebt.alpha = 0;
        _logintitlebt.hidden = YES;
        [self.view addSubview:_logintitlebt];
    }
    return _logintitlebt;
}
-(UIImageView *)nameimage
{
    if (!_nameimage) {
        _nameimage = [[UIImageView alloc]initWithFrame:CGRectMake((76)/widthreal, (546)/heightreal, 26/widthreal, 38/heightreal)];
        _nameimage.image = kLGetImage(@"手机图标");
        _nameimage.hidden=YES;
        _nameimage.alpha = 0;
        [self.view addSubview:_nameimage];
    }
    return _nameimage;
}
-(UILabel *)namelabel{
    if (!_namelabel) {
        _namelabel = [[UILabel alloc]initWithFrame:CGRectMake((142)/widthreal, (540)/heightreal, 506/widthreal, 48/heightreal)];
        _namelabel.text = @"请输入手机号码";
        _namelabel.alpha = 0;
        _namelabel.hidden = YES;
        _namelabel.font =[UIFont systemFontOfSize:17];
        _namelabel.textColor =UIColorFromRGBA(0xffffff,0.62);
        [self.view addSubview:_namelabel];
    }
    return _namelabel;
}
-(UITextField *)namefield{
    if (!_namefield) {
        _namefield = [[UITextField alloc]initWithFrame:CGRectMake((142)/widthreal, (546)/heightreal, 541/widthreal, 48/heightreal)];
        _namefield.borderStyle = UITextBorderStyleNone;
        _namefield.placeholder = @"";
        _namefield.textColor = [UIColor whiteColor];
        _namefield.font=[UIFont systemFontOfSize:17];
        _namefield.clearButtonMode =UITextFieldViewModeAlways;
        _namefield.delegate =self;
        UIButton *button = [_namefield valueForKey:@"_clearButton"];
        [button setImage:[UIImage imageNamed:@"快速删除"] forState:UIControlStateNormal];
        _namefield.clearButtonMode = UITextFieldViewModeWhileEditing;
        _namefield.borderStyle = UITextBorderStyleNone;
        _namefield.alpha= 0;
        _namefield.hidden =YES;
        [self.view addSubview:_namefield];
    }
    return _namefield;
}
-(UIView *)namebotline
{
    if (!_namebotline) {
        _namebotline =[[UIView alloc]initWithFrame:CGRectMake((65)/widthreal, (609)/heightreal, WIDGHT-(65)/widthreal*2 , 3/heightreal)];
        _namebotline.backgroundColor =UIColorFromRGBA(0xffffff,0.62);
        _namebotline.alpha = 0;
        _namebotline.hidden = YES;
        [self.view addSubview:_namebotline];
    }
    return _namebotline;
}
-(UIImageView *)pwdimage
{
    if (!_pwdimage) {
        _pwdimage = [[UIImageView alloc]initWithFrame:CGRectMake((76)/widthreal, (682)/heightreal, 26/widthreal, 38/heightreal)];
        _pwdimage.image = kLGetImage(@"密码图标");
        _pwdimage.hidden=YES;
        _pwdimage.alpha = 0;
        [self.view addSubview:_pwdimage];
    }
    return _pwdimage;
    
}
-(UILabel *)pwdlabel
{
    if (!_pwdlabel) {
        _pwdlabel = [[UILabel alloc]initWithFrame:CGRectMake((142)/widthreal, (678)/heightreal, 506/widthreal, 48/heightreal)];
        _pwdlabel.text = @"请设置您的登录密码";
        _pwdlabel.alpha = 0;
        _pwdlabel.hidden = YES;
        _pwdlabel.font =[UIFont systemFontOfSize:17];
        _pwdlabel.textColor =UIColorFromRGBA(0xffffff,0.62);
        [self.view addSubview:_pwdlabel];
    }
    return _pwdlabel;
}
-(UITextField *)pwdfield
{
    if (!_pwdfield) {
        _pwdfield = [[UITextField alloc]initWithFrame:CGRectMake((142)/widthreal, (682)/heightreal, 406/widthreal, 48/heightreal)];
        _pwdfield.borderStyle = UITextBorderStyleNone;
        _pwdfield.placeholder = @"";
        _pwdfield.textColor = [UIColor whiteColor];
        _pwdfield.font=[UIFont systemFontOfSize:17];
        _pwdfield.delegate =self;
        UIButton *button1 = [_pwdfield valueForKey:@"_clearButton"];
        [button1 setImage:[UIImage imageNamed:@"快速删除"] forState:UIControlStateNormal];
        _pwdfield.clearButtonMode = UITextFieldViewModeWhileEditing;
        _pwdfield.borderStyle = UITextBorderStyleNone;
        _pwdfield.secureTextEntry = YES;
        
        [self.view addSubview:_pwdfield];
    }
    return _pwdfield;
}
-(UIButton *)eyebt
{
    if (!_eyebt) {
        _eyebt = [UIButton buttonWithType:UIButtonTypeCustom];
        _eyebt.frame = CGRectMake(WIDGHT -65/widthreal -19 , (698)/heightreal, 19, 11);
        [_eyebt setImage:kLGetImage(@"隐藏密码图标") forState:UIControlStateNormal];
        _eyebt.hidden=YES;
        _eyebt.alpha = 0;
        [_eyebt addTarget:self action:@selector(eyebttapAct) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:_eyebt];
    }
    return _eyebt;
}
-(UIView *)pwdbotline
{
    if (!_pwdbotline) {
        _pwdbotline =[[UIView alloc]initWithFrame:CGRectMake((65)/widthreal, (751)/heightreal, WIDGHT-(65)/widthreal*2, 3/heightreal)];
        _pwdbotline.backgroundColor =UIColorFromRGBA(0xffffff,0.62);
        _pwdbotline.alpha = 0;
        _pwdbotline.hidden = YES;
        [self.view addSubview:_pwdbotline];
    }
    return _pwdbotline;
}
-(UIButton *)nextbt
{
    if (!_nextbt) {
        _nextbt = [UIButton buttonWithType:UIButtonTypeCustom];
        _nextbt.frame = CGRectMake(65/widthreal, _pwdbotline.frame.size.height+_pwdbotline.frame.origin.y+141/heightreal, 620/widthreal, 98/heightreal);
        _nextbt.backgroundColor = UIColorFromRGB(themeColor);
        _nextbt.layer.masksToBounds = YES;
        _nextbt.layer.cornerRadius = _nextbt.frame.size.height/2;
        [_nextbt setTitle:@"下一步" forState:UIControlStateNormal];
        [_nextbt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_nextbt addTarget:self action:@selector(nextbtAct:) forControlEvents:UIControlEventTouchUpInside];
        _nextbt.alpha = 0;
        _nextbt.hidden = YES;
        [self.view addSubview:_nextbt];
    }
    return _nextbt;
}
-(UILabel *)registknown
{
    if (!_registknown) {
        _registknown =[[UILabel alloc]initWithFrame:CGRectMake(65/widthreal,_nextbt.frame.size.height+_nextbt.frame.origin.y+33/heightreal,  WIDGHT -65/widthreal*2, 40/heightreal)];
        _registknown.textColor = UIColorFromRGBA(0xffffff,0.62);
        NSMutableAttributedString *hintString=[[NSMutableAttributedString alloc]initWithString:@"注册代表您同意《鱼头用户协议》"];
        //获取要调整颜色的文字位置,调整颜色
        NSRange range1=[[hintString string]rangeOfString:@"《鱼头用户协议》"];
        [hintString addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:range1];
        _registknown.attributedText=hintString;
        _registknown.textAlignment = NSTextAlignmentCenter;
        _registknown.font = [UIFont systemFontOfSize:14.0];
        _registknown.alpha = 0;
        _registknown.hidden = YES;
        [self.view addSubview:_registknown];
    }
    return _registknown;
}
-(UILabel *)forgetlabel
{
    if (!_forgetlabel) {
        _forgetlabel  = [[UILabel alloc]initWithFrame:CGRectMake(65/widthreal,_nextbt.frame.size.height+_nextbt.frame.origin.y+33/heightreal,   WIDGHT -65/widthreal*2, 40/heightreal)];
        _forgetlabel.textColor = UIColorFromRGBA(0xffffff,1);
        _forgetlabel.text = @"忘记密码";
        _forgetlabel.textAlignment = NSTextAlignmentCenter;
        _forgetlabel.font = [UIFont systemFontOfSize:14.0];
        _forgetlabel.hidden = YES;
        _forgetlabel.alpha =0;
        [self.view addSubview:_forgetlabel];
        
    }
    return _forgetlabel;
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
