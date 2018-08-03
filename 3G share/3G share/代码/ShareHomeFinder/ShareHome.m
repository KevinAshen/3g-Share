//
//  ShareHome.m
//  3G share
//
//  Created by 姜凯文 on 2018/7/27.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import "ShareHome.h"
#import "ShareHomeTableViewCell.h"
#import "ShareHomeHoliday.h"


@interface ShareHome ()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>


@end

@implementation ShareHome



- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.18f green:0.52f blue:0.77f alpha:1.00f];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:20],
    NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.navigationController.navigationBar.translucent = NO;
//    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationItem.title = @"SHARE";
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    //开始TableView的操作
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 480) style:UITableViewStyleGrouped];
    
    //注册
    [self.tableView registerClass:[ShareHomeTableViewCell class]  forCellReuseIdentifier:@"shareHomeCell"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    UIView* titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 208)];
    _tableView.tableHeaderView = titleView;
    
    _scrollView = [[UIScrollView alloc] init];
    _scrollView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200);
    //是否按照整页来滚动视图
    _scrollView.pagingEnabled = YES;
    //设置画布的大小，画布显示在滚动视图内部，一般大于Frame的大小
    _scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width*4,200);
    //开启横向弹动效果
    _scrollView.alwaysBounceHorizontal = YES;
    //显示横向滚动条
    _scrollView.showsHorizontalScrollIndicator = NO;
    //设置背景颜色
    _scrollView.delegate = self;
    
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(60, 170, 200, 30)];
    int count = 4;
    for (int i = 0; i < 4; i++) {
        NSString* strName = [NSString stringWithFormat:@"main_img%d",i+1];
        
        UIImage* image = [UIImage imageNamed:strName];
        
        UIImageView* iView = [[UIImageView alloc] initWithImage:image];
        
        iView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width*i, 0, [UIScreen mainScreen].bounds.size.width,200);
        
        [_scrollView addSubview:iView];
        
        //CGFloat x = i * size.width;
    }
    
    //4 设置pageControl
    self.pageControl.numberOfPages = count;
    self.pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    self.pageControl.pageIndicatorTintColor = [UIColor blackColor];
    //5 设置scrollView的代理
    _scrollView.delegate = self;
    //6 添加定时器
    [self addTimerTask];
    [titleView addSubview:_scrollView];
    [titleView addSubview:_pageControl];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 130;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
        ShareHomeTableViewCell *cell = nil;
    
    cell = [tableView dequeueReusableCellWithIdentifier:@"shareHomeCell"forIndexPath:indexPath];
    
    NSArray *button1Image = [NSArray arrayWithObjects:[UIImage imageNamed:@"list_img1"], [UIImage imageNamed:@"list_img2"], [UIImage imageNamed:@"list_img3"], [UIImage imageNamed:@"list_img4"], nil];
        
    NSArray *label1Text = [NSArray arrayWithObjects:@"假日\nshare小白\n原创-插画-练习习作\n15分钟前", @"国外画册欣赏\nshare小王\n平面设计-画册设计\n16分钟前", @"collection扁平化设计\nshare小吕\n平面设计-海报设计\n17分钟前", @"板式整理术：\n高效解决\nshare小王\n平面设计-版面设计\n18分钟前", nil];
        
        
    [cell.button1 setImage:button1Image[indexPath.section] forState:UIControlStateNormal];
    
    if (indexPath.section == 0) {
        [cell.button1 addTarget:self action:@selector(touchBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
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
        
        
    //[cell.button2 setImage:[UIImage imageNamed:@"button_zan"] forState:UIControlStateNormal];

    [cell.button2 setImage:[UIImage imageNamed:@"button_zan"] forState:UIControlStateNormal];
    [cell.button2 setTitleColor:[UIColor colorWithRed:0.18f green:0.52f blue:0.77f alpha:1.00f] forState:UIControlStateNormal];
    [cell.button2 setTitle:@"25" forState:UIControlStateNormal];
    [cell.button2 setTitle:@"26" forState:UIControlStateSelected];
    [cell.button2 addTarget:self action:@selector(touchZan:) forControlEvents:UIControlEventTouchUpInside];
    cell.button2.titleLabel.font = [UIFont systemFontOfSize:11];
    
    [cell.button3 setImage:[UIImage imageNamed:@"button_guanzhu"] forState:UIControlStateNormal];
    [cell.button3 setTitleColor:[UIColor colorWithRed:0.18f green:0.52f blue:0.77f alpha:1.00f] forState:UIControlStateNormal];
    [cell.button3 setTitle:@"33" forState:UIControlStateNormal];
    [cell.button3 setTitle:@"34" forState:UIControlStateSelected];
    [cell.button3 addTarget:self action:@selector(touchZan:) forControlEvents:UIControlEventTouchUpInside];
    cell.button3.titleLabel.font = [UIFont systemFontOfSize:11];
    
    [cell.button4 setImage:[UIImage imageNamed:@"button_share"] forState:UIControlStateNormal];
    [cell.button4 setTitleColor:[UIColor colorWithRed:0.18f green:0.52f blue:0.77f alpha:1.00f] forState:UIControlStateNormal];
    [cell.button4 setTitle:@"12" forState:UIControlStateNormal];
    [cell.button4 setTitle:@"13" forState:UIControlStateSelected];
    [cell.button4 addTarget:self action:@selector(touchZan:) forControlEvents:UIControlEventTouchUpInside];
    cell.button4.titleLabel.font = [UIFont systemFontOfSize:11];
        
    return cell;
}

-(void)touchBtn:(UIButton*)button
{
    ShareHomeHoliday *holidayViewController = [[ShareHomeHoliday alloc] init];
    
    holidayViewController.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:holidayViewController animated:YES];
    

}


-(void)touchZan:(UIButton*)button
{
    button.selected = !button.selected;
    
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
    return nil;
}

//并不知道什么意思的函数
- (UIView *) tableView:(UITableView *)tableView viewForRooterInSection:(NSInteger)section {
    return nil;
}

//-(void)layout{
//    //布局ScrollView
//    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 210)];
//    [self.view addSubview:_scrollView];
//
//    //布局pagecontrol
//    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(40, 170, 240, 30)];
//
//    [self.view addSubview:_pageControl];
//
//    int count = 4;
//    CGSize size = self.scrollView.frame.size;
//    //1 动态生成5个imageView
//    for (int i = 0; i < count; i++) {
//        //
//        UIImageView *iconView = [[UIImageView alloc] init];
//        [self.scrollView addSubview:iconView];
//
//        NSString *imgName = [NSString stringWithFormat:@"main_img%d",i+1];
//        iconView.image = [UIImage imageNamed:imgName];
//
//        CGFloat x = i * size.width;
//        //frame
//        iconView.frame = CGRectMake(x, 0, size.width, size.height);
//    }
//    //2 设置滚动范围
//    self.scrollView.contentSize = CGSizeMake(count * size.width, 0);
//    self.scrollView.showsHorizontalScrollIndicator = NO;
//    //3 设置分页
//    self.scrollView.pagingEnabled = YES;
//
//    //4 设置pageControl
//    self.pageControl.numberOfPages = count;
//    self.pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
//    self.pageControl.pageIndicatorTintColor = [UIColor blackColor];
//    //5 设置scrollView的代理
//    self.scrollView.delegate = self;
//    //6 添加定时器
//    [self addTimerTask];
//
//}

//把定时器封装起来 方便调用
-(void)addTimerTask{
    //6 定时器
    NSTimer *timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    
    self.timer = timer;
    
    //消息循环
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    // 默认是NSDefaultRunLoopMode  但是另外一个属性NSRunLoopCommonModes 能够在多线程中起作用
    [runloop addTimer:timer forMode:NSDefaultRunLoopMode];
    
    //立即执行定时器的方法  fire 是定时器自带的方法
    // [timer fire];
}

-(void)nextImage{
    //当前页码
    NSInteger page = self.pageControl.currentPage;
    //如果是到达最后一张
    if (page == self.pageControl.numberOfPages - 1) {
        page = 0;
        //设置偏移量  当到达最后一张时候 切换到第一张  不产生从最后一张倒回第一张效果
        _scrollView.contentOffset = CGPointMake(0, 0);
        [_scrollView setContentOffset:_scrollView.contentOffset animated:YES];
    }else{
        page++;
    }
    //  self.scrollView setContentOffset:(CGPoint) animated:(BOOL)
    
    CGFloat offsetX = page * self.scrollView.frame.size.width;
    [UIView animateWithDuration:1.0 animations:^{
        self.scrollView.contentOffset = CGPointMake(offsetX, 0);
    }];
}

//正在滚动的时候
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //   (offset.x + 100/2)/100
    int page = (scrollView.contentOffset.x + scrollView.frame.size.width / 2)/ scrollView.frame.size.width;
    self.pageControl.currentPage = page;
}
//当你点击图片按住不动的时候 把定时器停止
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //停止定时器
    [self.timer invalidate];
}
//当不再按图片 也就是松开的时候 立马调用计时器方法
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    //用scheduledTimerWithTimeInterval 创建定时器是用的系统默认的方法 当遇见多线程时候会出现问题
    //    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    //所以还是调用上面创建的定时器方法
    [self addTimerTask];
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
