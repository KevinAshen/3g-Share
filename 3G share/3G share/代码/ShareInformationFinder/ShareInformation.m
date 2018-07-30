//
//  ShareInformation.m
//  3G share
//
//  Created by 姜凯文 on 2018/7/27.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import "ShareInformation.h"
#import "ShareInformationTableViewCell.h"

@interface ShareInformation () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ShareInformation

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.18f green:0.52f blue:0.77f alpha:1.00f];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:25],
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
    [self.tableView registerClass:[ShareInformationTableViewCell class]  forCellReuseIdentifier:@"cell1"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        ShareInformationTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"cell1"forIndexPath:indexPath];
        cell1.image1.image = [UIImage imageNamed:@"works_head"];
            
        cell1.label1.font = [UIFont systemFontOfSize:10];
            
        NSString *str = @"share小白\n数媒/设计爱好者\n不开心了就哭，开心了就过会儿再哭";
        NSArray *tempArr = [str componentsSeparatedByString:@"数"];
            NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:str];
        
        cell1.label1.numberOfLines = 0;
        
        [AttributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:18.0] range:NSMakeRange(0, ((NSString *)tempArr[0]).length)];
        cell1.label1.attributedText = AttributedStr;
            
        cell1.image2.image = [UIImage imageNamed:@"zan1"];

        return cell1;
    } else {
        UITableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
        if (cell2 == nil) {
            cell2 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell2"];
            
            NSArray *iconImage = [NSArray arrayWithObjects:[UIImage imageNamed:@"img2"], [UIImage imageNamed:@"img4"], [UIImage imageNamed:@"button_zan"], [UIImage imageNamed:@"img5"], [UIImage imageNamed:@"img6"], [UIImage imageNamed:@"img7"], nil];
            cell2.imageView.image = iconImage[indexPath.row];
            
            NSArray *labelText = [NSArray arrayWithObjects:@"我上传的",  @"我的信息", @"我推荐的", @"院系通知", @"设置", @"退出", nil];
            cell2.textLabel.text = labelText[indexPath.row];
            
            UIImageView *icon2 = [[UIImageView alloc] initWithFrame:CGRectMake(260, 15, 15, 15)];
            [icon2 setImage:[UIImage imageNamed:@"img3"]];
            
            [cell2.contentView addSubview:icon2];
        }
        return cell2;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 120;
    } else {
        return 60;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else {
        return 6;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return 10;
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
