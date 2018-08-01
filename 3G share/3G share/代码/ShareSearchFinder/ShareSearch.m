//
//  ShareSearch.m
//  3G share
//
//  Created by 姜凯文 on 2018/7/27.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import "ShareSearch.h"
#import "ShareUp.h"
#import "DaViewController.h"


@interface ShareSearch ()

@end

@implementation ShareSearch

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.18f green:0.52f blue:0.77f alpha:1.00f];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:20],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.title = @"搜索";
    
    UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    leftBtn.frame = CGRectMake(0, 0, 25,25);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"back_img"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftBarBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * rightBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    rightBtn.frame = CGRectMake(0, 0, 25,25);
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"上传"] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(rightBarBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.92f green:0.92f blue:0.93f alpha:1.00f];
    
    self.searchBar = [[UITextField alloc]initWithFrame:CGRectMake(10, 0, 300, 30)];
    self.searchBar.text=@"搜索 用户名 作品分类 文章";
    self.searchBar.backgroundColor = [UIColor whiteColor];
    self.searchBar.delegate = self;
    self.searchBar.borderStyle = UITextBorderStyleRoundedRect;
    [self.searchBar addTarget:self action:@selector(dabai:) forControlEvents:UIControlEventEditingDidEnd];
    [self.view addSubview:self.searchBar];
    
    
    NSArray *tagText = [NSArray arrayWithObjects:@[@"平面设计", @"网页设计", @"UI/icon", @"插画/手绘", @"虚拟设计", @"影视", @"摄影", @"其他"], @[@"人气最高", @"收藏最多", @"评论最多", @"编辑精选"], @[@"30分钟前", @"1小时前", @"1月前", @"1年前"], nil];
    

    UIImageView *line1 = [[UIImageView alloc] initWithFrame:CGRectMake(6, 40, 300, 30)];
    [line1 setImage:[UIImage imageNamed:@"lines1"]];
    [self.view addSubview:line1];
    for (int i = 0; i < 8; i++) {
        UIButton *tag1 = [[UIButton alloc] initWithFrame:CGRectMake(10 + 75 * (i % 4), 80 + ((i / 4) * 40), 65, 30)];
        tag1.titleLabel.textAlignment = NSTextAlignmentCenter;
        tag1.layer.masksToBounds = YES;
        tag1.layer.cornerRadius = 3;
        tag1.titleLabel.font = [UIFont systemFontOfSize:14];
        tag1.backgroundColor = [UIColor whiteColor];
        [tag1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [tag1 setTitle:tagText[0][i] forState:UIControlStateNormal];
        [tag1 addTarget:self action:@selector(touch:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:tag1];
    }
    
    for (int i = 1; i < 3; i++) {
        UIImageView *line2 = [[UIImageView alloc] initWithFrame:CGRectMake(6, 160 + 80 * (i / 2), 300, 30)];
        if (i == 1) {
            [line2 setImage:[UIImage imageNamed:@"lines2"]];
        } else {
            [line2 setImage:[UIImage imageNamed:@"lines3"]];
        }
        [self.view addSubview:line2];
        for (int j = 0; j < 8; j++) {
            UIButton *tag2 = [[UIButton alloc] initWithFrame:CGRectMake(10 + 75 * (j % 4), 200 + ((i / 2) * 80), 65, 30)];
            tag2.titleLabel.textAlignment = NSTextAlignmentCenter;
            tag2.layer.masksToBounds = YES;
            tag2.layer.cornerRadius = 3;
            tag2.titleLabel.font = [UIFont systemFontOfSize:14];
            tag2.backgroundColor = [UIColor whiteColor];
            [tag2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [tag2 setTitle:tagText[i][j % 4] forState:UIControlStateNormal];
            [tag2 addTarget:self action:@selector(touch:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:tag2];
        }
    }
}

- (void)dabai:(UITextField *)tf{
    NSString *str = tf.text;
    NSString *str1 = @"大白";
    if ([str1 isEqualToString:str])  {
        DaViewController *daViewController = [[DaViewController alloc] init];
        [self.navigationController pushViewController:daViewController animated:YES];
    }
}

- (void)touch:(UIButton *)button {
    button.selected = !button.selected;
    if(button.selected){
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor whiteColor]];
    }else{
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor colorWithRed:0.18f green:0.52f blue:0.77f alpha:1.00f]];
    }
    
}

//点击屏幕空白处调用此函数
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //虚拟键盘回收，不再作为第一消息响应者
    [self.searchBar resignFirstResponder];
}

- (void)leftBarBtnClicked:(UIButton *)btn
{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightBarBtnClicked:(UIButton *)btn
{
    ShareUp *upViewController = [ShareUp alloc];
    
    upViewController.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:upViewController animated:YES];
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
