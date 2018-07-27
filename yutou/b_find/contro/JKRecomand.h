//
//  JKRecomand.h
//  yutou
//
//  Created by 余浩 on 2018/7/27.
//  Copyright © 2018年 jack. All rights reserved.
//

#import "JKViewController.h"


@protocol JKRecomanddelegate<NSObject>
-(void)tableviewdidSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface JKRecomand : JKViewController
@property (nonatomic, strong) UITableView *tableView;
@property(nonatomic ,assign)id <JKRecomanddelegate> delegate;
@end
