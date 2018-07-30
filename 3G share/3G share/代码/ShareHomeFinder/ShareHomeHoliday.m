//
//  ShareHomeHoliday.m
//  3G share
//
//  Created by 姜凯文 on 2018/7/30.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import "ShareHomeHoliday.h"
#import "ShareHome.h"

@interface ShareHomeHoliday () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;

@end

@implementation ShareHomeHoliday

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        UITableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
        if (cell1 == nil) {
            cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell1"];
            cell1.imageView.image = [UIImage imageNamed:@"sixin_img1"];
            cell1.textLabel.text = @"假日";
            cell1.detailTextLabel.text = @"share小白";
            
            UIImageView *image1 = [[UIImageView alloc] initWithFrame:CGRectMake(180, 10, 120, 50)];
            [image1 setImage:[UIImage imageNamed:@"zan"]];
            [cell1.contentView addSubview:image1];
        }
        return cell1;
    } else {
        UITableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
        if (cell2 == nil) {
            cell2 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell2"];
            
            UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 300, 30)];
            label1.text = @"多希望列车能把我带到有你的城市。";
            label1.font = [UIFont systemFontOfSize:10];
            [cell2.contentView addSubview:label1];
            
            UIImageView *image1 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 50, 300, 170)];
            [image1 setImage:[UIImage imageNamed:@"works_img1"]];
            [cell2.contentView addSubview:image1];
            
            UIImageView *image2 = [[UIImageView alloc] initWithFrame:CGRectMake(10, 230, 300, 170)];
            [image2 setImage:[UIImage imageNamed:@"works_img2"]];
            [cell2.contentView addSubview:image2];

            UIImageView *image3 = [[UIImageView alloc] initWithFrame:CGRectMake(60, 410, 170, 300)];
            [image3 setImage:[UIImage imageNamed:@"works_img3"]];
            [cell2.contentView addSubview:image3];

            UIImageView *image4 = [[UIImageView alloc] initWithFrame:CGRectMake(60, 720, 170, 300)];
            [image4 setImage:[UIImage imageNamed:@"works_img5"]];
            [cell2.contentView addSubview:image4];

        }
        return cell2;

    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 55;
    } else {
        return 1050;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
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


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 500) style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.18f green:0.52f blue:0.77f alpha:1.00f];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:25],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.title = @"SHARE";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    leftBtn.frame = CGRectMake(0, 0, 25,25);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"back_img"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftBarBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    
    //self.tabBarController.tabBar.hidden = YES;

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
