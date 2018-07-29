//
//  ShareLand.m
//  3G share
//
//  Created by 姜凯文 on 2018/7/27.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import "ShareLand.h"
#import "ShareRegister.h"
#import "ShareHome.h"
#import "AppDelegate.h"
#import "ShareArticle.h"
#import "ShareActivity.h"
#import "ShareLand.h"
#import "ShareStart.h"
#import "ShareSearch.h"
#import "ShareInformation.h"
#import "ShareStart.h"

@interface ShareLand ()<UIApplicationDelegate>

@end

@implementation ShareLand

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *backGround = [UIImage imageNamed:@"kaiji1"];
    self.view.layer.contents = (id) backGround.CGImage;
    
    UIImageView  *yuan =[[UIImageView alloc] initWithFrame:CGRectMake(100, 80, 120, 120)];
    
    UILabel  *share = [[UILabel alloc] initWithFrame:CGRectMake(98, 175, 200, 100)];
    share.text = @"share";
    share.font = [UIFont systemFontOfSize:54];
    share.textColor = [UIColor whiteColor];
    
    UIImageView *dengLu_1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    dengLu_1.image = [UIImage imageNamed:@"user_img"];
    
    UIImageView *miMa_1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    miMa_1.image = [UIImage imageNamed:@"pass_img"];
    
    UITextField *dengLu = [[UITextField alloc] initWithFrame:CGRectMake(50, 300, 230, 50)];
    UITextField *miMa = [[UITextField alloc] initWithFrame:CGRectMake(50, 370, 230, 50)];
    
    UIButton *button_Deng = [[UIButton alloc] init];
    button_Deng.backgroundColor = [UIColor colorWithRed:0.24f green:0.58f blue:0.85f alpha:1.00f];
    button_Deng.layer.masksToBounds = YES;
    button_Deng.layer.borderWidth = 1;
    button_Deng.layer.borderColor = [UIColor whiteColor].CGColor;
    button_Deng.frame = CGRectMake(60, 450, 100, 40);
    button_Deng.layer.cornerRadius = 5;
    [button_Deng setTitle:@"登录" forState:UIControlStateNormal];
    [button_Deng setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button_Deng addTarget:self action:@selector(touchBtn1:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button_Zhu = [[UIButton alloc] init];
    button_Zhu.backgroundColor = [UIColor colorWithRed:0.24f green:0.58f blue:0.85f alpha:1.00f];
    button_Zhu.layer.masksToBounds = YES;
    button_Zhu.layer.borderWidth = 1;
    button_Zhu.layer.borderColor = [UIColor whiteColor].CGColor;
    button_Zhu.frame = CGRectMake(180, 450, 100, 40);
    button_Zhu.layer.cornerRadius = 5;
    [button_Zhu setTitle:@"注册" forState:UIControlStateNormal];
    [button_Zhu setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button_Zhu addTarget:self action:@selector(touchBtn:) forControlEvents:UIControlEventTouchUpInside];
    
     [dengLu setBorderStyle:UITextBorderStyleRoundedRect];
    dengLu.leftView = dengLu_1;
    dengLu.leftViewMode = UITextFieldViewModeAlways;

    [miMa setBorderStyle:UITextBorderStyleRoundedRect];
    miMa.leftView = miMa_1;
    miMa.leftViewMode = UITextFieldViewModeAlways;
    
    [yuan setImage:[UIImage imageNamed:@"kaiji_logo.psd"]];
    
    [self.view addSubview:yuan];
    [self.view addSubview:share];
    [self.view addSubview:dengLu];
    [self.view addSubview:miMa];
    [self.view addSubview:button_Deng];
    [self.view addSubview:button_Zhu];
}

-(void)touchBtn:(UIButton*)button
{
    ShareRegister *shareRegister = [[ShareRegister alloc] init];
    [self presentViewController:shareRegister animated:YES completion:nil];
}

-(void)touchBtn1:(UIButton*)button
{
    //控制器创建（导航栏）
    ShareHome *shareHome = [[ShareHome alloc] init];
    shareHome.tabBarItem.image = [[UIImage imageNamed:@"radio_button1_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    shareHome.tabBarItem.selectedImage = [[UIImage imageNamed:@"radio_button1_pressed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    ShareSearch *shareSearch = [[ShareSearch alloc] init];
    shareSearch.tabBarItem.image = [[UIImage imageNamed:@"radio_button2_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    shareSearch.tabBarItem.selectedImage = [[UIImage imageNamed:@"radio_button2_pressed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    ShareArticle *shareArticle = [[ShareArticle alloc] init];
    shareArticle.tabBarItem.image = [[UIImage imageNamed:@"radio_button3_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    shareArticle.tabBarItem.selectedImage = [[UIImage imageNamed:@"radio_button3_pressed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    ShareActivity *shareActivity = [[ShareActivity alloc] init];
    shareActivity.tabBarItem.image = [[UIImage imageNamed:@"radio_button4_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    shareActivity.tabBarItem.selectedImage = [[UIImage imageNamed:@"radio_button4_pressed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    ShareInformation *shareInformation = [[ShareInformation alloc] init];
    shareInformation.tabBarItem.image = [[UIImage imageNamed:@"radio_button5_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    shareInformation.tabBarItem.selectedImage = [[UIImage imageNamed:@"radio_button5_pressed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //分栏相关
    UITabBarController* tbController = [[UITabBarController alloc] init];
    tbController.tabBar.translucent = NO;
    
    
    [[UITabBar appearance]setBackgroundColor:[UIColor blackColor]];
    
    //导航栏相关
    UINavigationController * navHome = [[UINavigationController alloc]initWithRootViewController:shareHome];
    UINavigationController * navSearch = [[UINavigationController alloc]initWithRootViewController:shareSearch];
    UINavigationController * navArticle = [[UINavigationController alloc]initWithRootViewController:shareArticle];
    UINavigationController * navInformation = [[UINavigationController alloc]initWithRootViewController:shareInformation];
    UINavigationController * navActivity = [[UINavigationController alloc]initWithRootViewController:shareActivity];
    
    NSArray* arrayMY = [NSArray arrayWithObjects:navHome, navSearch, navArticle, navActivity, navInformation, nil];
    tbController.viewControllers = arrayMY;
    
    
    tbController.selectedIndex = 0;
    
    [self presentViewController:tbController animated:YES completion:nil];
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
