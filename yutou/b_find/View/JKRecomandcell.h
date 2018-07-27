//
//  JKRecomandcell.h
//  yutou
//
//  Created by 余浩 on 2018/7/24.
//  Copyright © 2018年 jack. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JKRecomandModel;
@interface JKRecomandcell : UITableViewCell
@property (nonatomic, strong) JKRecomandModel *RecomandModel;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *taglabel;
@property (nonatomic, strong) UILabel *authorLabel;
@property (nonatomic, strong) UILabel *readnumLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIView  *likebg;
@property (nonatomic, strong) UIImageView  *likeimg;
@property (nonatomic, strong) UILabel  *liketext;
@property (nonatomic, strong) UIImageView  *img;
@end
