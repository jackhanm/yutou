//
//  JKChoosetitle.m
//  yutou
//
//  Created by 余浩 on 2018/7/25.
//  Copyright © 2018年 jack. All rights reserved.
//

#import "JKChoosetitle.h"
#import "JKfind.h"

@interface JKChoosetitle ()

@end

@implementation JKChoosetitle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGB(0xf8f8f8);
    UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(bacj)];
    [self.view addGestureRecognizer:tap];
    // Do any additional setup after loading the view.
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
