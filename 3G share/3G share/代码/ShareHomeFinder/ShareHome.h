//
//  ShareHome.h
//  3G share
//
//  Created by 姜凯文 on 2018/7/27.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShareHome : UIViewController

@property (strong, nonatomic) UIWindow *window;


@property (nonatomic,retain) UIScrollView *scrollView;
@property (nonatomic,retain) UIPageControl *pageControl;
@property (nonatomic,strong)NSTimer *timer;


@end
