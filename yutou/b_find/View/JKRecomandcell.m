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
@property (nonatomic, strong) UILabel *titleLabel;
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
}
-(void)setRecomandModel:(JKRecomandModel *)RecomandModel
{
    self.titleLabel.text = RecomandModel.title;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(200);
        make.left.mas_equalTo(20);
        make.right.mas_equalTo(-20);
        make.top.mas_equalTo(20);
    }];
    
}
-(UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        
    }
    return _titleLabel;
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
