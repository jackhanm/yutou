//
//  JKChannelItemhead.h
//  yutou
//
//  Created by 余浩 on 2018/7/26.
//  Copyright © 2018年 jack. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^edit)(void);
@interface JKChannelItemhead : UICollectionReusableView
@property(nonatomic,strong) UILabel *mainLable;
@property(nonatomic,strong) UILabel *subLable;
@property(nonatomic,strong) UIButton *editBtn;
@property(nonatomic,copy)edit editAct;
@end
