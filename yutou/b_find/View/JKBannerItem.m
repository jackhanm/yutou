

//
//  JKBannerItem.m
//  yutou
//
//  Created by 余浩 on 2018/7/27.
//  Copyright © 2018年 jack. All rights reserved.
//

#import "JKBannerItem.h"
@interface JKBannerItem ()
@property (nonatomic, weak) UILabel *label;
@end
@implementation JKBannerItem
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self addLabel];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.backgroundColor = [UIColor clearColor];
        [self addLabel];
    }
    return self;
}


- (void)addLabel {
    UILabel *label = [[UILabel alloc]init];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:18];
    [self addSubview:label];
    _label = label;
    
    self.img = [[UIImageView alloc]init];
    [self addSubview:self.img];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.img.layer.cornerRadius =5;
    self.img.frame = self.bounds;
}
@end
