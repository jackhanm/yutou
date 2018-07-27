//
//  JKRecomandcell.m
//  yutou
//
//  Created by 余浩 on 2018/7/24.
//  Copyright © 2018年 jack. All rights reserved.
//

#import "JKRecomandcell.h"
#import "JKRecomandModel.h"
@interface JKRecomandcell()

@end


@implementation JKRecomandcell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createview];
    }
    return self;
}

-(void)createview
{
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.taglabel];
    [self.contentView addSubview:self.authorLabel];
    [self.contentView addSubview:self.likebg];
    [self.contentView addSubview:self.likeimg];
    [self.contentView addSubview:self.liketext];
    [self.contentView addSubview:self.timeLabel];
     [self.contentView addSubview:self.readnumLabel];
    [self.contentView addSubview:self.img];
    
    
}
-(void)setRecomandModel:(JKRecomandModel *)RecomandModel
{
    self.titleLabel.text = RecomandModel.title;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(97/heightreal);
        make.left.mas_equalTo(34/widthreal);
        make.width.mas_equalTo(423/widthreal);
        make.top.mas_equalTo(30/heightreal);
    }];
    [_img mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(180/widthreal);
        make.left.mas_equalTo(self.titleLabel.mas_right).offset(24/widthreal);
        make.width.mas_equalTo(240/heightreal);
        make.top.mas_equalTo(30/heightreal);
    }];
    [_likebg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(36/widthreal);
        make.right.mas_equalTo(self.img.mas_left).offset(-24/widthreal);
        make.width.mas_equalTo(108/heightreal);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(30/heightreal);
    }];
    [self.taglabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(36/heightreal);
        make.left.mas_equalTo(34/widthreal);
        make.width.mas_equalTo(108/heightreal);
        make.top.mas_equalTo(self.titleLabel.mas_bottom).offset(30/heightreal);
    }];
    [self.authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(224/widthreal);
        make.height.mas_equalTo(36/heightreal);
        make.left.mas_equalTo(34/widthreal);
        make.top.mas_equalTo(self.img.mas_bottom).offset(22/heightreal);
    }];
    [self.authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(224/widthreal);
        make.height.mas_equalTo(36/heightreal);
        make.left.mas_equalTo(34/widthreal);
        make.top.mas_equalTo(self.img.mas_bottom).offset(22/heightreal);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(133/widthreal);
        make.height.mas_equalTo(36/heightreal);
        make.right.mas_equalTo(self.img.mas_right);
        make.top.mas_equalTo(self.img.mas_bottom).offset(22/heightreal);
    }];
    [self.readnumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.timeLabel.mas_left);
//        make.left.mas_equalTo(self.authorLabel.mas_right);
        make.width.mas_offset(259/widthreal);
        make.height.mas_equalTo(36/heightreal);
        make.top.mas_equalTo(self.img.mas_bottom).offset(22/heightreal);
    }];
    
    
    
    
    
    
}
-(UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:45/2];
        _titleLabel.textColor = UIColorFromRGB(0x333333);
        _titleLabel.numberOfLines =2;
        _titleLabel.backgroundColor =randomColor;
    }
    return _titleLabel;
}
-(UILabel *)taglabel
{
    if (!_taglabel) {
        _taglabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _taglabel.font = [UIFont systemFontOfSize:45/2];
        _taglabel.textColor = UIColorFromRGB(0x666666);
        _taglabel.numberOfLines =1;
        _taglabel.backgroundColor =randomColor;
        
    }
    return _taglabel;
}
-(UILabel *)authorLabel
{
    if (!_authorLabel) {
        _authorLabel = [[UILabel alloc]init];
        _authorLabel.backgroundColor =randomColor;
    }
    return _authorLabel;
}
-(UIView *)likebg
{
    if (!_likebg) {
        _likebg = [[UIView alloc]init];
        _likebg.backgroundColor =randomColor;
       
    }
    return _likebg;
}
-(UIImageView *)likeimg
{
    if (!_likeimg) {
        _likeimg = [[UIImageView alloc]init];
        
    }
    return _likeimg;
}
-(UILabel *)liketext
{
    if (!_liketext) {
        _liketext = [[UILabel alloc]init];
        
    }
    return _liketext;
}
-(UILabel *)timeLabel
{
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.backgroundColor =randomColor;
        
    }
    return _timeLabel;
}
-(UILabel *)readnumLabel
{
    if (!_readnumLabel) {
        _readnumLabel = [[UILabel alloc]init];
        _readnumLabel.backgroundColor =randomColor;
        
    }
    return _timeLabel;
}
-(UIImageView *)img
{
    if (!_img) {
        _img = [[UIImageView alloc]init];
        _img.backgroundColor =randomColor;
    }
    return _img;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
