//
//  AppDelegate.m
//  yutou
//
//  Created by 余浩 on 2018/7/5.
//  Copyright © 2018年 jack. All rights reserved.
//

#import "AppDelegate.h"
#import "JKenter.h"
#import "EaseMessageViewController.h"
#import "EaseConversationListViewController.h"
#import "JKenter.h"
#import "JKroot.h"
#import "JKfind.h"
#import "JKmine.h"
#import <CYLTabBarController.h>
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //环信
    [self createhuanxin];
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    // 判断是否需要登录
    JKenter *firstViewController = [[JKenter alloc] init];
    UINavigationController *JKenterNavigationController = [[UINavigationController alloc]
                                                   initWithRootViewController:firstViewController];
    
    self.window.rootViewController =JKenterNavigationController;
    JKenterNavigationController.navigationBarHidden = YES;
    void (^bolck1)(void) = ^(void) {
        self.window.rootViewController = [self setupViewControllers];
    };
    [firstViewController loginblock:bolck1];
//
    [self.window makeKeyAndVisible];
    
    
    
    return YES;
}
- (CYLTabBarController * )setupViewControllers {
    JKfind *firstViewController = [[JKfind alloc] init];
    UINavigationController *firstNavigationController = [[UINavigationController alloc]
                                                   initWithRootViewController:firstViewController];
    firstNavigationController.navigationBarHidden = YES;
    JKroot *secondViewController = [[JKroot alloc] init];
    UIViewController *secondNavigationController = [[UINavigationController alloc]
                                                    initWithRootViewController:secondViewController];
    
    JKmine *ThirdViewController = [[JKmine alloc] init];
    UIViewController *ThirdNavigationController = [[UINavigationController alloc]
                                                    initWithRootViewController:ThirdViewController];
  
   
    CYLTabBarController *tabBarController = [[CYLTabBarController alloc] init];
    [self customizeTabBarForController:tabBarController];
    
    [tabBarController setViewControllers:@[
                                           firstNavigationController,
                                           secondNavigationController,
                                           ThirdNavigationController,
                                         
                                           ]];
    return  tabBarController;
}

- (void)customizeTabBarForController:(CYLTabBarController *)tabBarController {
    
    NSDictionary *dict1 = @{
                            CYLTabBarItemTitle : @"发现",
                            CYLTabBarItemImage : @"发现-未选中",
                            CYLTabBarItemSelectedImage : @"发现-选中",
                            };
    NSDictionary *dict2 = @{
                            CYLTabBarItemTitle : @"好友",
                            CYLTabBarItemImage : @"鱼-未选中",
                            CYLTabBarItemSelectedImage : @"鱼-选中",
                            };
    NSDictionary *dict3 = @{
                            CYLTabBarItemTitle : @"我的",
                            CYLTabBarItemImage : @"我的-未选中",
                            CYLTabBarItemSelectedImage : @"我的-选中",
                            };
   
    
    
    NSArray *tabBarItemsAttributes =[NSArray arrayWithObjects:dict1,dict2,dict3, nil];
    tabBarController.tabBarItemsAttributes = tabBarItemsAttributes;
    [[UITabBar appearance] setShadowImage:[[UIImage alloc] init]];
    
    
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] =UIColorFromRGB(themeColor);
    
    // set the text Attributes
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
   
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
}










// APP进入后台
- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [[EMClient sharedClient] applicationDidEnterBackground:application];
}

// APP将要从后台返回
- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [[EMClient sharedClient] applicationWillEnterForeground:application];
}


-(void)createhuanxin
{
    EMOptions *options = [EMOptions optionsWithAppkey:@"yuhao#appdemo"];
    options.apnsCertName = @"istore_dev";
    [[EMClient sharedClient] initializeSDKWithOptions:options];
    EMError *error = [[EMClient sharedClient] registerWithUsername:@"5002" password:@"111111"];
    if (error==nil) {
        NSLog(@"注册成功");
    }
    EMError *error2 = [[EMClient sharedClient] loginWithUsername:@"5002" password:@"111111"];
    if (!error2) {
        NSLog(@"登录成功");
    }
  
    [[EMClient sharedClient].contactManager addContact:@"5002"
                                               message:@"我想加您为好友"
                                            completion:^(NSString *aUsername, EMError *aError) {
                                                if (!aError) {
                                                    NSLog(@"邀请发送成功");
                                                }
                                            }];
   
    EaseMessageViewController *chatController = [[EaseMessageViewController alloc] initWithConversationChatter:@"5003" conversationType:EMConversationTypeChat];
    [[EMClient sharedClient] addDelegate:self delegateQueue:nil];
    [[EMClient sharedClient] addMultiDevicesDelegate:self delegateQueue:nil];
    [[EMClient sharedClient].groupManager addDelegate:self delegateQueue:nil];
    [[EMClient sharedClient].contactManager addDelegate:self delegateQueue:nil];
    [[EMClient sharedClient].roomManager addDelegate:self delegateQueue:nil];
    [[EMClient sharedClient].chatManager addDelegate:self delegateQueue:nil];
    
    
}
#pragma mark - EMContactManagerDelegate

- (void)didReceiveAgreedFromUsername:(NSString *)aUsername
{
    NSString *msgstr = [NSString stringWithFormat:NSLocalizedString(@"friend.acceptedToAdd", nil), aUsername];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:msgstr delegate:nil cancelButtonTitle:NSLocalizedString(@"ok", @"Ok") otherButtonTitles:nil, nil];
    [alertView show];
}

- (void)didReceiveDeclinedFromUsername:(NSString *)aUsername
{
    NSString *msgstr = [NSString stringWithFormat:NSLocalizedString(@"friend.declinedToAdd", nil), aUsername];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:msgstr delegate:nil cancelButtonTitle:NSLocalizedString(@"ok", @"Ok") otherButtonTitles:nil, nil];
    [alertView show];
}

- (void)didReceiveDeletedFromUsername:(NSString *)aUsername
{
    NSString *msgstr = [NSString stringWithFormat:NSLocalizedString(@"friend.declinedToAdd", nil), aUsername];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:msgstr delegate:nil cancelButtonTitle:NSLocalizedString(@"ok", @"Ok") otherButtonTitles:nil, nil];
    [alertView show];
}

- (void)didReceiveAddedFromUsername:(NSString *)aUsername
{
//    [_contactViewVC reloadDataSource];
    NSString *msgstr = [NSString stringWithFormat:NSLocalizedString(@"friend.declinedToAdd", nil), aUsername];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:msgstr delegate:nil cancelButtonTitle:NSLocalizedString(@"ok", @"Ok") otherButtonTitles:nil, nil];
    [alertView show];
}

- (void)didReceiveFriendInvitationFromUsername:(NSString *)aUsername
                                       message:(NSString *)aMessage
{
    NSString *msgstr = [NSString stringWithFormat:NSLocalizedString(@"friend.Invitation", nil), aUsername];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:msgstr delegate:nil cancelButtonTitle:NSLocalizedString(@"ok", @"Ok") otherButtonTitles:nil, nil];
    [alertView show];
}


- (void)messagesDidReceive:(NSArray *)aMessages
{
    
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
