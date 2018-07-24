//
//  JKRecomandModel.h
//  yutou
//
//  Created by 余浩 on 2018/7/24.
//  Copyright © 2018年 jack. All rights reserved.
//

#import "JKbaseModel.h"

@interface JKRecomandModel : JKbaseModel
@property (nonatomic, copy) NSString *picUrl;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *views;
@property (nonatomic, copy) NSString *likes;
@end
