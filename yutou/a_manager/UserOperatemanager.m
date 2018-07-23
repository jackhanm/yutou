//
//  UserOperatemanager.m
//  kuaichecaifu
//
//  Created by 余浩 on 2017/9/26.
//  Copyright © 2017年 ct. All rights reserved.
//

#import "UserOperatemanager.h"


//全局变量
static UserOperatemanager *_instance=nil;
@implementation UserOperatemanager
+(instancetype)shareManager{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _instance=[[super allocWithZone:NULL] init];
    });
    
    return _instance;
}

+(id) allocWithZone:(struct _NSZone *)zone
{
    return [UserOperatemanager shareManager];
}

-(id) copyWithZone:(struct _NSZone *)zone
{
    return [UserOperatemanager shareManager];
}
- (BOOL) isFirstLoad{
    NSString *currentVersion = [[[NSBundle mainBundle] infoDictionary]
                                objectForKey:@"CFBundleShortVersionString"];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString *lastRunVersion = [defaults objectForKey:LAST_RUN_VERSION_KEY];
    
    if (!lastRunVersion) {
        [defaults setObject:currentVersion forKey:LAST_RUN_VERSION_KEY];
        return YES;
    }
    else if (![lastRunVersion isEqualToString:currentVersion]) {
        [defaults setObject:currentVersion forKey:LAST_RUN_VERSION_KEY];
        return YES;
    }
    return NO;
}

@end
