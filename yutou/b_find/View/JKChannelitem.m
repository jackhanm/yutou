//
//  JKChannelitem.m
//  yutou
//
//  Created by 余浩 on 2018/7/26.
//  Copyright © 2018年 jack. All rights reserved.
//

#import "JKChannelitem.h"
@interface JKChannelitem ()

@end

@implementation JKChannelitem

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createview];
    }
    return self;
}
-(void)createview
{
    self.backgroundColor = UIColorFromRGB(0xeeeeee);
    [self addSubview:self.titlelabel];
    [self addSubview:self.deletebtn];
  
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    [self.titlelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
    }];
    [self.deletebtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(14, 14));
        make.right.equalTo(self).offset(6);
        make.top.equalTo(self).offset(-6);
        
        
    }];
    
}
-(UILabel *)titlelabel{
    if(!_titlelabel){
        _titlelabel=[UILabel new];
        _titlelabel.font=[UIFont systemFontOfSize:15];
        _titlelabel.textColor=UIColorFromRGB(0x333333);
        _titlelabel.text=@"内容";
    }
    return _titlelabel;
}
-(UIButton *)deletebtn{
    if(!_deletebtn){
        _deletebtn=[UIButton new];
        _deletebtn.hidden=YES;
        [_deletebtn setImage:[UIImage imageNamed:@"已选栏目-关闭"] forState:UIControlStateNormal];
        [_deletebtn addTarget:self action:@selector(delclickAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _deletebtn;
}
-(void)setIsEdit:(BOOL)isEdit{
    _isEdit=isEdit;
    if(_isEdit){
        self.deletebtn.hidden=NO;
    }else{
        self.deletebtn.hidden=YES;
        
    }
}
-(void)delclickAction:(UIButton *)sender
{
    if (self.deleteAct) {
        self.deleteAct(self.num);
    }
}
@end
