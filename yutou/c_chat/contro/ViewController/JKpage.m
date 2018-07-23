
//
//  JKpage.m
//  yutou
//
//  Created by 余浩 on 2018/7/9.
//  Copyright © 2018年 jack. All rights reserved.
//

#import "JKpage.h"
#import "JKenter.h"
#import "EaseMessageViewController.h"
#import "EaseConversationListViewController.h"
#import "EaseUsersListViewController.h"
#import "ContactListViewController.h"
#import "AddFriendViewController.h"
@interface JKpage ()
@property (nonatomic, strong)  NSArray *menuList;
@property (nonatomic, assign)  BOOL autoSwitch;

@end

@implementation JKpage

- (void)viewDidLoad {
    [super viewDidLoad];
    self.magicView.itemScale = 1.2;
    self.magicView.headerHeight = 64;
    self.magicView.navigationHeight = 64;
    self.magicView.againstStatusBar = YES;
    //    self.magicView.sliderExtension = 5.0;
    //    self.magicView.switchStyle = VTSwitchStyleStiff;
    self.magicView.navigationInset = UIEdgeInsetsMake(20, 0, 0, 0);
    self.magicView.headerView.backgroundColor = [UIColor whiteColor];
    self.magicView.navigationColor = [UIColor whiteColor];
    self.magicView.layoutStyle = VTLayoutStyleDefault;
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.magicView.separatorColor = [UIColor whiteColor];
    self.magicView.sliderColor = [UIColor whiteColor];
      [self generateTestData];
      [self integrateComponents];
    [self.magicView reloadData];
    
   
}

- (void)integrateComponents {
    UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, 30)];
    [rightButton addTarget:self action:@selector(subscribeAction) forControlEvents:UIControlEventTouchUpInside];
    [rightButton setTitleColor:RGBACOLOR(169, 37, 37, 0.6) forState:UIControlStateSelected];
    [rightButton setTitleColor:RGBCOLOR(169, 37, 37) forState:UIControlStateNormal];
    [rightButton setTitle:@"+" forState:UIControlStateNormal];
    rightButton.titleLabel.font = [UIFont boldSystemFontOfSize:28];
    rightButton.center = self.view.center;
    self.magicView.rightNavigatoinItem = rightButton;
}
-(void)subscribeAction
{
    AddFriendViewController *addController = [[AddFriendViewController alloc] init];
    [self.navigationController pushViewController:addController animated:YES];
}
#pragma mark - functional methods
- (void)generateTestData {
    NSString *title = @"消息";
    NSString *title1 = @"好友";
    NSMutableArray *menuList = [[NSMutableArray alloc] initWithCapacity:24];
    [menuList addObject:title];
    [menuList addObject:title1];
  
    _menuList = menuList;
}
#pragma mark - VTMagicViewDataSource
- (NSArray<NSString *> *)menuTitlesForMagicView:(VTMagicView *)magicView {
  
   
    return _menuList;
}
- (UIButton *)magicView:(VTMagicView *)magicView menuItemAtIndex:(NSUInteger)itemIndex
{
    static NSString *itemIdentifier = @"itemIdentifier";
    UIButton *menuItem = [magicView dequeueReusableItemWithIdentifier:itemIdentifier];
    if (!menuItem) {
        menuItem = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuItem setTitleColor:RGBCOLOR(50, 50, 50) forState:UIControlStateNormal];
        [menuItem setTitleColor:RGBCOLOR(169, 37, 37) forState:UIControlStateSelected];
        menuItem.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:16.f];
    }
    return menuItem;
}

- (UIViewController *)magicView:(VTMagicView *)magicView viewControllerAtPage:(NSUInteger)pageIndex
{
    if (0 == pageIndex) {
        static NSString *recomId = @"recom.identifier";
        EaseConversationListViewController *recomViewController = [magicView dequeueReusablePageWithIdentifier:recomId];
        if (!recomViewController) {
            recomViewController = [[EaseConversationListViewController alloc] init];
        }
        return recomViewController;
    }
    
    static NSString *gridId = @"grid.identifier";
    ContactListViewController *gridViewController = [magicView dequeueReusablePageWithIdentifier:gridId];
    if (!gridViewController) {
        gridViewController = [[ContactListViewController alloc] init];
    }
    return gridViewController;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
