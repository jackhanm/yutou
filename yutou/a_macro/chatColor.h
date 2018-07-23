//
//  chatColor.h
//  yutou
//
//  Created by 余浩 on 2018/7/19.
//  Copyright © 2018年 jack. All rights reserved.
//

#ifndef chatColor_h
#define chatColor_h

#define random(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)/255.0]
#define randomColor random(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
#define themeColor 0xff8652

#endif /* chatColor_h */
