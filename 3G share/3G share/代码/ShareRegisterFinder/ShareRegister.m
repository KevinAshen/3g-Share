//
//  ShareRegister.m
//  3G share
//
//  Created by 姜凯文 on 2018/7/27.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import "ShareRegister.h"
#import "ShareLand.h"

@interface ShareRegister ()

@end

@implementation ShareRegister

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    UIImage *backGround = [UIImage imageNamed:@"kaiji1"];
    self.view.layer.contents = (id) backGround.CGImage;
    
    UIImageView  *yuan =[[UIImageView alloc] initWithFrame:CGRectMake(100, 80, 120, 120)];
    UILabel  *share = [[UILabel alloc] initWithFrame:CGRectMake(98, 175, 200, 100)];
    share.text = @"share";
    share.font = [UIFont systemFontOfSize:54];
    share.textColor = [UIColor whiteColor];
    
    UIImageView *youXiang_1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    youXiang_1.image = [UIImage imageNamed:@"email_img"];
    UIImageView *dengLu_1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    dengLu_1.image = [UIImage imageNamed:@"user_img"];
    UIImageView *miMa_1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    miMa_1.image = [UIImage imageNamed:@"pass_img"];
    
    UITextField *youXiangTextField = [[UITextField alloc] initWithFrame:CGRectMake(50, 300, 230, 50)];
    UITextField *dengLu = [[UITextField alloc] initWithFrame:CGRectMake(50, 370, 230, 50)];
    UITextField *miMa = [[UITextField alloc] initWithFrame:CGRectMake(50, 440, 230, 50)];

    
    UIButton *button_Deng = [[UIButton alloc] init];
    button_Deng.backgroundColor = [UIColor colorWithRed:0.24f green:0.58f blue:0.85f alpha:1.00f];
    button_Deng.layer.masksToBounds = YES;
    button_Deng.layer.borderWidth = 1;
    button_Deng.layer.borderColor = [UIColor whiteColor].CGColor;
    button_Deng.frame = CGRectMake(80, 510, 170, 40);
    button_Deng.layer.cornerRadius = 5;
    [button_Deng setTitle:@"登录成功" forState:UIControlStateNormal];
    [button_Deng setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button_Deng addTarget:self action:@selector(touchBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    [dengLu setBorderStyle:UITextBorderStyleRoundedRect];
    dengLu.leftView = dengLu_1;
    dengLu.leftViewMode = UITextFieldViewModeAlways;

    [youXiangTextField setBorderStyle:UITextBorderStyleRoundedRect];
    youXiangTextField.leftView = youXiang_1;
    youXiangTextField.leftViewMode = UITextFieldViewModeAlways;
    
    [miMa setBorderStyle:UITextBorderStyleRoundedRect];
    miMa.leftView = miMa_1;
    miMa.leftViewMode = UITextFieldViewModeAlways;
    
    [yuan setImage:[UIImage imageNamed:@"kaiji_logo.psd"]];
    
    [self.view addSubview:yuan];
    [self.view addSubview:share];
    [self.view addSubview:dengLu];
    [self.view addSubview:miMa];
    [self.view addSubview:youXiangTextField];
    [self.view addSubview:button_Deng];
    
}
-(void)touchBtn:(UIButton*)button
{
    ShareLand *shareLand = [[ShareLand alloc] init];
    [self presentViewController:shareLand animated:YES completion:nil];
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
