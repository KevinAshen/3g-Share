//
//  ShareInformationMessage.m
//  3G share
//
//  Created by 姜凯文 on 2018/7/27.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import "ShareInformationMessage.h"
#import "ShareInformationMessageNew.h"
#import "ShareInformationMessageLetter.h"

@interface ShareInformationMessage () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ShareInformationMessage

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.18f green:0.52f blue:0.77f alpha:1.00f];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:20],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.title = @"个人信息";
    UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    leftBtn.frame = CGRectMake(0, 0, 25,25);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"back_img"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftBarBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //开始TableView的操作
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 450) style:UITableViewStyleGrouped];
    
    //注册
    //[self.tableView registerClass:[ShareInformationTableViewCell class]  forCellReuseIdentifier:@"cell1"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
    if (cell1 == nil) {
        cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell1"];
        NSArray *textNSArry = [NSArray arrayWithObjects:@"评论", @"推荐我的", @"新关注的", @"私信", @"活动通知", nil];
        
        cell1.textLabel.text = textNSArry[indexPath.section];
        
        NSArray *numNSArry = [NSArray arrayWithObjects:@"7", @"9", @"5", @"4", @"1", nil];
        cell1.detailTextLabel.text = numNSArry[indexPath.section];
        cell1.detailTextLabel.textColor = [UIColor colorWithRed:0.41f green:0.66f blue:0.84f alpha:1.00f];
        
        UIImageView *icon2 = [[UIImageView alloc] initWithFrame:CGRectMake(260, 23, 15, 15)];
        [icon2 setImage:[UIImage imageNamed:@"img3"]];
        
        [cell1.contentView addSubview:icon2];
        
        

    }
    return cell1;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 2 ) {
        ShareInformationMessageNew *newViewController = [[ShareInformationMessageNew alloc] init];
        newViewController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:newViewController animated:YES];
    }
    if (indexPath.section == 3) {
        ShareInformationMessageLetter *letterViewController = [[ShareInformationMessageLetter alloc] init];
        letterViewController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:letterViewController animated:YES];
    }
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    return 0.01;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}


- (void)leftBarBtnClicked:(UIButton *)btn
{
    
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
