
//
//  JKChannelItemhead.m
//  yutou
//
//  Created by 余浩 on 2018/7/26.
//  Copyright © 2018年 jack. All rights reserved.
//

#import "JKChannelItemhead.h"

@implementation JKChannelItemhead
-(id)initWithFrame:(CGRect)frame{
    if(self=[super initWithFrame:frame])
    {
        [self configSubView];
    }
    return self;
}

-(void)configSubView{
    [self addSubview:self.mainLable];
    [self addSubview:self.subLable];
    [self addSubview:self.editBtn];
    
    
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    [self.mainLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(10);
        make.centerY.equalTo(self);
        
    }];
    [self.subLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mainLable.mas_right).offset(8);
        make.bottom.equalTo(self.mainLable);
        
    }];
    [self.editBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(52, 24));
        make.right.equalTo(self).offset(0/widthreal);
        make.centerY.equalTo(self);
    }];
}
-(UILabel *)mainLable
{
    if(!_mainLable){
        _mainLable=[UILabel new];
        _mainLable.text=@"已选栏目";
        _mainLable.font=[UIFont systemFontOfSize:14];
        _mainLable.textColor=UIColorFromRGB(0x999999);
    }
    return _mainLable;
}

-(UILabel *)subLable{
    if(!_subLable){
        _subLable=[UILabel new];
        _subLable.text=@"";
        _subLable.font=[UIFont systemFontOfSize:12];
        _subLable.textColor=[UIColor grayColor];
    }
    return _subLable;
}
-(UIButton *)editBtn
{
    if(!_editBtn){

        _editBtn=[UIButton new];
        [_editBtn setTitle:@"编辑" forState:UIControlStateNormal];
        [_editBtn setTitleColor:UIColorFromRGB(themeColor)  forState:UIControlStateNormal];
        _editBtn.titleLabel.font=[UIFont systemFontOfSize:14];
        _editBtn.layer.masksToBounds=YES;
        _editBtn.layer.cornerRadius=10;
        _editBtn.layer.borderWidth=0;
        _editBtn.layer.borderColor=UIColorFromRGB(themeColor).CGColor;
        [_editBtn addTarget:self action:@selector(editAction) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _editBtn;
}
-(void)editAction
{
    if (_editAct) {
        _editAct();
    }
}
@end
