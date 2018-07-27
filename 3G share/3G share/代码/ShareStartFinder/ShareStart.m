//
//  ShareStart.m
//  3G share
//
//  Created by 姜凯文 on 2018/7/27.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import "ShareStart.h"
#import "ShareLand.h"

@interface ShareStart ()

@end

@implementation ShareStart

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    UIImage *backGround = [UIImage imageNamed:@"login_1.jpg"];
    self.view.layer.contents = (id) backGround.CGImage;    // 如果需要背景透明加上下面这句
    self.view.layer.backgroundColor = [UIColor clearColor].CGColor;
    
    //延迟2s调用，一般启动页面会停留，或者有些动画什么的，本例只简述思路，不深究细节
    [self performSelector:@selector(changeView) withObject:self afterDelay:1];
   
}

- (void)changeView {
    UIWindow *window = self.view.window;
    ShareLand *main = [[ShareLand alloc] init];
    
    //添加一个缩放效果
    main.view.transform = CGAffineTransformMakeScale(0.2, 0.2);
    [UIView animateWithDuration:0.1 animations:^{
        main.view.transform = CGAffineTransformIdentity;
    }];
    
    window.rootViewController = main;
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
