//
//  ShareUp.m
//  3G share
//
//  Created by 姜凯文 on 2018/7/27.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import "ShareUp.h"
#import "LMJDropdownMenu.h"

@interface ShareUp ()<LMJDropdownMenuDelegate>

@end

@implementation ShareUp

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.18f green:0.52f blue:0.77f alpha:1.00f];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:20],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.title = @"上传";
    UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    leftBtn.frame = CGRectMake(0, 0, 25,25);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"back_img"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftBarBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.view.backgroundColor = [UIColor colorWithRed:0.92f green:0.92f blue:0.93f alpha:1.00f];
    
    UIButton *chooseButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 170, 100)];
    chooseButton.backgroundColor = [UIColor colorWithRed:0.81f green:0.81f blue:0.81f alpha:1.00f];
    [chooseButton setTitle:@"选择图片" forState:UIControlStateNormal];
    [chooseButton setTitleColor:[UIColor colorWithRed:0.96f green:0.96f blue:0.96f alpha:1.00f] forState:UIControlStateNormal];
    [self.view addSubview:chooseButton];
    
    UIImageView *diImageView = [[UIImageView alloc] initWithFrame:CGRectMake(210, 40, 90, 20)];
    [diImageView setImage:[UIImage imageNamed:@"dizhi"]];
    [self.view addSubview:diImageView];
    
    LMJDropdownMenu * dropdownMenu = [[LMJDropdownMenu alloc] init];
    dropdownMenu.layer.masksToBounds = YES;
    dropdownMenu.layer.borderWidth = 1;
    dropdownMenu.layer.borderColor = [UIColor blackColor].CGColor;
    [dropdownMenu.layer setMasksToBounds:YES];
    [dropdownMenu.layer setCornerRadius:5];
    [dropdownMenu setFrame:CGRectMake(210, 70, 90, 20)];
    [dropdownMenu setMenuTitles:@[@"设计资料",@"设计师观点",@"设计教程"] rowHeight:30];
    dropdownMenu.tintColor = [UIColor colorWithRed:0.81f green:0.80f blue:0.80f alpha:1.00f];
    dropdownMenu.delegate = self;
    [self.view addSubview:dropdownMenu];
}

- (void)leftBarBtnClicked:(UIButton *)btn {
    [self.navigationController popViewControllerAnimated:YES];
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
