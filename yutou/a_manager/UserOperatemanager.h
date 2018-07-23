//
//  UserOperatemanager.h
//  kuaichecaifu
//
//  Created by 余浩 on 2017/9/26.
//  Copyright © 2017年 ct. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserOperatemanager : NSObject
+(instancetype)shareManager;
//第一次打开应用
- (BOOL)isFirstLoad;





@end
