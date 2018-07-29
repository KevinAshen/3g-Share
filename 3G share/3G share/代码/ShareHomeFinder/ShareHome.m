//
//  ShareHome.m
//  3G share
//
//  Created by 姜凯文 on 2018/7/27.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import "ShareHome.h"
#import "ShareHomeTableViewCell.h"


@interface ShareHome ()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

@property (nonatomic, strong)UITableView *tableView;

@end

@implementation ShareHome



- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.18f green:0.52f blue:0.77f alpha:1.00f];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:25],
    NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.navigationController.navigationBar.translucent = NO;
//    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationItem.title = @"SHARE";
    
    //开始TableView的操作
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    
    //注册
    [self.tableView registerClass:[ShareHomeTableViewCell class]  forCellReuseIdentifier:@"shareHomeCell"];
    
    //两行设置不要忘了
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    //自动调整子视图大小
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight |UIViewAutoresizingFlexibleWidth;
    
    [self.view addSubview:_tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 140;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        ShareHomeTableViewCell *cell = nil;
    
    cell = [tableView dequeueReusableCellWithIdentifier:@"shareHomeCell"forIndexPath:indexPath];
    
        NSArray *button1Image = [NSArray arrayWithObjects:[UIImage imageNamed:@"list_img1"], [UIImage imageNamed:@"list_img2"], [UIImage imageNamed:@"list_img3"], [UIImage imageNamed:@"list_img4"], nil];
        
        NSArray *label1Text = [NSArray arrayWithObjects:@"假日\nshare小白\n原创-插画-练习习作\n15分钟前", @"国外画册欣赏\nshare小王\n平面设计-画册设计\n16分钟前", @"collection扁平化设计\nshare小吕\n平面设计-海报设计\n17分钟前", @"板式整理术：\n高效解决\nshare小王\n平面设计-版面设计\n18分钟前", nil];
        
        
        [cell.button1 setImage:button1Image[indexPath.section] forState:UIControlStateNormal];
        
        
        cell.label1.font = [UIFont systemFontOfSize:12];
        cell.label1.textAlignment = NSTextAlignmentLeft;
        cell.label1.numberOfLines = 0;
        
        NSString *str = label1Text[indexPath.section];
        NSArray *tempArr = [str componentsSeparatedByString:@"s"];
        NSMutableAttributedString *AttributedStr = [[NSMutableAttributedString alloc]initWithString:str];
        
        [AttributedStr addAttribute:NSFontAttributeName
         
                              value:[UIFont systemFontOfSize:20.0]
         
                              range:NSMakeRange(0, ((NSString *)tempArr[0]).length)];
        
        cell.label1.attributedText = AttributedStr;
        
        
        [cell.button2 setImage:[UIImage imageNamed:@"点赞"] forState:UIControlStateNormal];
        
        
        return cell;
//    } else {
//        UITableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:@"homeCell1"];
//
////        UIScrollView *cellScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 320, 210)];
////
////        //布局ScrollView
//////        self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(20,40, 280, 130)];
//////        [self.view addSubview:_scrollView];
////
////        UIPageControl *cellPageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(30, 180, 200, 20)];
////
//////        //布局pagecontrol
//////        self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(100, 140, 200, 30)];
//////
//////        [self.view addSubview:_pageControl];
////
////        int count = 4;
////        CGSize size = cellScrollView.frame.size;
////        //1 动态生成5个imageView
////        for (int i = 0; i < count; i++) {
////            //
////            UIImageView *iconView = [[UIImageView alloc] init];
////            [cellScrollView addSubview:iconView];
////
////            NSString *imgName = [NSString stringWithFormat:@"main_img%d",i+1];
////            iconView.image = [UIImage imageNamed:imgName];
////
////            CGFloat x = i * size.width;
////            //frame
////            iconView.frame = CGRectMake(x, 0, size.width, size.height);
////        }
////        //2 设置滚动范围
////        cellScrollView.contentSize = CGSizeMake(count * size.width, 0);
////        cellScrollView.showsHorizontalScrollIndicator = NO;
////        //3 设置分页
////        cellScrollView.pagingEnabled = YES;
////
////        //4 设置pageControl
////        cellPageControl.numberOfPages = count;
////        cellPageControl.currentPageIndicatorTintColor = [UIColor blueColor];
////        cellPageControl.pageIndicatorTintColor = [UIColor blackColor];
////        //5 设置scrollView的代理
////        cellScrollView.delegate = self;
////        //6 添加定时器
////        [self addTimerTask];
////
////        [cell1.contentView addSubview:cellScrollView];
////        [cell1.contentView addSubview:cellPageControl];
//
//        if (cell1 == nil) {
//            cell1 = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"homeCell1"];
//            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 20, 20)];
//
//            button.titleLabel.text = @"123";
//
//            [cell1.contentView addSubview:button];
//        }
//        return cell1;
//    }
//
//
}

- (CGFloat)tableView:(UITableView *)tableView heightForRooterInSection:(NSInteger)section
{
    
    return 0.01;
}


//获取头部高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
 
    return 0.01;
}

//获取每组尾部标题
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return nil;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return nil;
}

//并不知道什么意思的函数
- (UIView *) tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    //    UIView * test = [UIView new];
    //    test.backgroundColor = [UIColor purpleColor];
    return nil;
}

//并不知道什么意思的函数
- (UIView *) tableView:(UITableView *)tableView viewForRooterInSection:(NSInteger)section {
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
