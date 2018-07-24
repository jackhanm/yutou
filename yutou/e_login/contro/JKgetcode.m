//
//  JKgetcode.m
//  yutou
//
//  Created by 余浩 on 2018/7/20.
//  Copyright © 2018年 jack. All rights reserved.
//

#import "JKgetcode.h"
#import "JQUnitField.h"
#import "JKgetuserInfo.h"
@interface JKgetcode ()<JQUnitFieldDelegate>
@property(nonatomic, retain)UIImageView *backimage;
@property(nonatomic, retain)UILabel *titlelabel;
@property(nonatomic, retain)UILabel *subtitlelabel;
@property(nonatomic, retain)UILabel *noticelable;
@property(nonatomic, retain)UILabel *phonelabel;
@property(nonatomic, retain)UIButton *nextbt;
@property (nonatomic, strong) JQUnitField *unitField;
@end

@implementation JKgetcode

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor whiteColor];
    [self createview];
    // Do any additional setup after loading the view.
}
-(void)createview
{
    _backimage = [[UIImageView alloc]initWithFrame:CGRectMake((37)/widthreal, (74)/heightreal, 19, 15)];
    _backimage.image = kLGetImage(@"返回上一页面");
    _backimage.userInteractionEnabled =YES;
    
    _subtitlelabel =[[UILabel alloc]initWithFrame:CGRectMake(63/widthreal, 244/heightreal, (WIDGHTSCALE -130)/widthreal, 90/heightreal)];
    _subtitlelabel.text = @"手机号验证";
    _subtitlelabel.textColor = UIColorFromRGB(0x333333);
    _subtitlelabel.font = [UIFont systemFontOfSize:32.0];
    
    _noticelable =[[UILabel alloc]initWithFrame:CGRectMake(63/widthreal, 361/heightreal, (275)/widthreal, 45/heightreal)];
    _noticelable.text = @"验证码已发送至";
    _noticelable.textColor = UIColorFromRGB(0x999999);
    _noticelable.font = [UIFont systemFontOfSize:16.0];
    
    _phonelabel =[[UILabel alloc]initWithFrame:CGRectMake(_noticelable.frame.size.width+_noticelable.frame.origin.x, 366/heightreal, (242)/widthreal, 36/heightreal)];
    _phonelabel.text = [NSString getSecrectStringWithPhoneNumber:@"13716959617"];
    _phonelabel.textColor = UIColorFromRGB(0x666666);
    _phonelabel.font = [UIFont systemFontOfSize:16.0];
    
    _unitField = [[JQUnitField alloc]initWithFrame:CGRectMake(63/widthreal, 525/heightreal, [UIScreen mainScreen].bounds.size.width-100, 40)];
    _unitField.inputUnitCount = 6;
    _unitField.delegate = self;
    _unitField.secureTextEntry = NO; // 密文
    
    // 检测数据变化
    [_unitField addTarget:self action:@selector(unitFieldEditingChanged:) forControlEvents:UIControlEventEditingChanged];
    
    
    _nextbt = [UIButton buttonWithType:UIButtonTypeCustom];
    _nextbt.frame = CGRectMake(65/widthreal, self.unitField.frame.size.height+self.unitField.frame.origin.y+ 112/heightreal, 620/widthreal, 98/heightreal);
    _nextbt.backgroundColor = UIColorFromRGB(themeColor);
    _nextbt.layer.masksToBounds = YES;
    _nextbt.layer.cornerRadius = _nextbt.frame.size.height/2;
    [_nextbt setTitle:@"下一步" forState:UIControlStateNormal];
    [_nextbt setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_nextbt addTarget:self action:@selector(nextbtAct) forControlEvents:UIControlEventTouchUpInside];
   
   
    
    
    
    UIView *view =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    [view addSubview:_backimage];
    
 
    [self.view addSubview:view];
    
    
    [self.view addSubview:_subtitlelabel];
    UITapGestureRecognizer *backtap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backtapAct)];
    [view addGestureRecognizer:backtap];
    [self.view addSubview:_phonelabel];
    [self.view addSubview:_noticelable];
     [self.view addSubview:_unitField];
    [self.view addSubview:_nextbt];
}
-(void)nextbtAct{
    JKgetuserInfo *vc= [[JKgetuserInfo alloc]init];
    vc.Regist = _goRegist;
    [self.navigationController pushViewController:vc animated:YES];
}
// 检测数据变化
- (void)unitFieldEditingChanged:(JQUnitField *)sender
{
    NSLog(@"%@", sender.text); // 我们想要的数据
}

#pragma Mark --- JQUnitFieldDelegate ---
- (BOOL)unitField:(JQUnitField *)uniField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view.window endEditing:YES];
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
