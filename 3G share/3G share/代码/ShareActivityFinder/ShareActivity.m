//
//  ShareActivity.m
//  3G share
//
//  Created by 姜凯文 on 2018/7/27.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import "ShareActivity.h"
#import "ShareActivityTableViewCell.h"

@interface ShareActivity () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation ShareActivity

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.18f green:0.52f blue:0.77f alpha:1.00f];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:25],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.title = @"活动";
    UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    leftBtn.frame = CGRectMake(0, 0, 25,25);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"back_img"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftBarBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.view.backgroundColor = [UIColor colorWithRed:0.92f green:0.92f blue:0.93f alpha:1.00f];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 450)];
    [self.tableView registerClass:[ShareActivityTableViewCell class] forCellReuseIdentifier:@"cell1"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ShareActivityTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"cell1"forIndexPath:indexPath];
    NSArray *imageNSArry = [NSArray arrayWithObjects:[UIImage imageNamed:@"main_img1"], [UIImage imageNamed:@"main_img2"], [UIImage imageNamed:@"main_img3"], [UIImage imageNamed:@"main_img4"], nil];
    NSArray *textNSArry = [NSArray arrayWithObjects:@"你以为在首页看过我就再也看不到我了吗？笨蛋！", @"下厨也要美美的，从一条围裙开始的围裙创意设计大赛", @"图片大量重复使用，请原谅，谁让你下载了本APP呢", @"图片固然重复，文字却凸显新意，这是什么精神？", nil];
    
    [cell1.image1 setImage:imageNSArry[indexPath.row]];
    cell1.label1.text = textNSArry[indexPath.row];
    
    cell1.label1.font = [UIFont systemFontOfSize:11];
    
    return cell1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 170;
}

- (void)leftBarBtnClicked:(UIButton *)btn
{
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
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
