//
//  JKChannelitem.h
//  yutou
//
//  Created by 余浩 on 2018/7/26.
//  Copyright © 2018年 jack. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^Edit)(NSInteger sender);

@interface JKChannelitem : UICollectionViewCell
@property(nonatomic,strong) UILabel *titlelabel;
@property(nonatomic,strong) UIButton *deletebtn;
@property(nonatomic,copy)Edit deleteAct;

@property(nonatomic,assign)BOOL isEdit;
@property(nonatomic,assign)int num;
@end
