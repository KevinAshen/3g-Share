//
//  ShareInformationSetBasic.m
//  3G share
//
//  Created by 姜凯文 on 2018/7/27.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import "ShareInformationSetBasic.h"

@interface ShareInformationSetBasic () <UITableViewDelegate,  UITableViewDataSource>

@property (nonatomic , strong) UITableView *tableView;

@end

@implementation ShareInformationSetBasic

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.18f green:0.52f blue:0.77f alpha:1.00f];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:20],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.title = @"基本资料";
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
    
    NSArray *textNSArry = [NSArray arrayWithObjects:@"头像", @"昵称", @"签名", @"性别", @"邮箱", nil];
    
    if (indexPath.row == 0) {
        UITableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
        if (cell1 == nil) {
            cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1"];
        
            cell1.textLabel.text = textNSArry[indexPath.row];
            
            
            UIImageView *image1 = [[UIImageView alloc] initWithFrame:CGRectMake(80, 20, 60, 60)];
            [image1 setImage:[UIImage imageNamed:@"works_head"]];
            
            [cell1.contentView addSubview:image1];
        }
        return cell1;
    }
    if (indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 4) {
        UITableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
        if (cell2 == nil) {
            cell2 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell2"];
            
            NSArray *text1NSArry = [NSArray arrayWithObjects:@"share小白", @"不开心了就哭，开心了就过会儿再哭", @"123", @"186####2332@qq.com", nil];
            
            cell2.textLabel.text = textNSArry[indexPath.row];
            
            UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(80, 10, 250, 40)];
            label1.text = text1NSArry[indexPath.row - 1];
            label1.font = [UIFont systemFontOfSize:14];
            [cell2.contentView addSubview:label1];
        }
        return cell2;
    } else {
        UITableViewCell *cell3 = [tableView dequeueReusableCellWithIdentifier:@"cell3"];
        if (cell3 == nil) {
            cell3 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell3"];
            cell3.textLabel.text = textNSArry[indexPath.row];
            
            UIImageView *image3 = [[UIImageView alloc] initWithFrame:CGRectMake(80, 10, 100, 40)];
            
            image3.image = [UIImage imageNamed:@"man"];
            
            [cell3.contentView addSubview:image3];
        }
        return cell3;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 100;
    } else {
        return 60;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
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
