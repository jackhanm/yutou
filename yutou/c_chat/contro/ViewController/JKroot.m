


//
//  JKroot.m
//  yutou
//
//  Created by 余浩 on 2018/7/10.
//  Copyright © 2018年 jack. All rights reserved.
//

#import "JKroot.h"
#import "JKpage.h"
@interface JKroot ()<UIScrollViewDelegate>
@property (nonatomic, retain)UIScrollView *crollview;
@property(nonatomic, retain) JKpage *page;
@end

@implementation JKroot

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createview];
    
    // Do any additional setup after loading the view.
}
-(void)createview{
    self.crollview = [[UIScrollView alloc]init];
    self.crollview.frame= CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    self.crollview.backgroundColor = [UIColor whiteColor];
    self.crollview.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height+28);
    self.crollview.showsHorizontalScrollIndicator = NO;
    self.crollview.delegate =self;
    self.page= [[JKpage alloc]init];
    [self addChildViewController:self.page];
    [self.crollview addSubview:self.page.view];
    [self.view addSubview:self.crollview];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView

{
    
    CGFloat y = self.crollview.contentOffset.y;
    
    
    
    
    CGFloat alpha = scrollView.contentOffset.y/24;
    if (alpha > 1) {
        alpha = 1;
        NSLog(@"发送通知");
        [[NSNotificationCenter defaultCenter]postNotificationName:@"tableviewCanskip" object:nil];
    }
    
    self.page.magicView.navigationColor = [UIColor colorWithRed:242.0/255 green:100.0/255 blue:50.0/255 alpha:alpha];
    
    
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
