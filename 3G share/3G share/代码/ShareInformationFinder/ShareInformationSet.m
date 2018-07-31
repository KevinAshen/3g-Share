//
//  ShareInformationSet.m
//  3G share
//
//  Created by 姜凯文 on 2018/7/27.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import "ShareInformationSet.h"
#import "ShareInformationSetBasic.h"
#import "ShareInformationSetPassword.h"
#import "ShareInformationSetMessage.h"


@interface ShareInformationSet ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ShareInformationSet

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
    self.view.backgroundColor = [UIColor colorWithRed:0.92f green:0.92f blue:0.93f alpha:1.00f];
    
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
        cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
        
        NSArray *textNSArry = [NSArray arrayWithObjects:@"基本资料", @"修改密码", @"消息设置", @"关于SHARE", @"清除缓存", nil];
        cell1.textLabel.text = textNSArry[indexPath.row];
        
        UIImageView *icon1 = [[UIImageView alloc] initWithFrame:CGRectMake(260, 20, 15, 15)];
        [icon1 setImage:[UIImage imageNamed:@"img3"]];
        
        [cell1.contentView addSubview:icon1];
    }
    return cell1;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return 0;
    }
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
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

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0 ) {
        ShareInformationSetBasic *basicViewController = [[ShareInformationSetBasic alloc] init];
        basicViewController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:basicViewController animated:YES];
    }
    if (indexPath.row == 1) {
        ShareInformationSetPassword *passwordViewController = [[ShareInformationSetPassword alloc] init];
        passwordViewController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:passwordViewController animated:YES];
    }
    if (indexPath.row == 2) {
        ShareInformationSetMessage *messageViewController = [[ShareInformationSetMessage alloc] init];
        messageViewController.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:messageViewController animated:YES];
    }
    if (indexPath.row == 4) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"是否清除缓存" message:@"清除后不可恢复" preferredStyle: UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDestructive handler:nil];
        
        [alertController addAction:cancelAction];
        
        [alertController addAction:deleteAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
    
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
