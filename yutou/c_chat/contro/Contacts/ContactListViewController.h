//
//  ContactListViewController.h
//  yutou
//
//  Created by 余浩 on 2018/7/10.
//  Copyright © 2018年 jack. All rights reserved.
//

#import "EaseUsersListViewController.h"

@interface ContactListViewController : EaseUsersListViewController

//好友请求变化时，更新好友请求未处理的个数
- (void)reloadApplyView;

//群组变化时，更新群组页面
- (void)reloadGroupView;

//好友个数变化时，重新获取数据
- (void)reloadDataSource;

//添加好友的操作被触发
- (void)addFriendAction;
@end
