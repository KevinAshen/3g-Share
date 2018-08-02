//
//  ShareUpChoose.m
//  3G share
//
//  Created by 姜凯文 on 2018/7/27.
//  Copyright © 2018年 姜凯文. All rights reserved.
//

#import "ShareUpChoose.h"
#import "uoLoadingCollectionViewCell.h"

@interface ShareUpChoose ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>


@property (nonatomic,retain)NSDictionary *itemDic; // 承载一个item上面显示的图片和文字
@property (nonatomic,retain)NSMutableArray *allDataArray; // 成方所有的item上显示的内容，其实就是盛放小字典
@end

@implementation ShareUpChoose



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.18f green:0.52f blue:0.77f alpha:1.00f];
    [self.navigationController.navigationBar setTitleTextAttributes:
     @{NSFontAttributeName:[UIFont systemFontOfSize:20],
       NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    self.navigationController.navigationBar.translucent = NO;
    self.navigationItem.title = @"选择图片";
    UIButton * leftBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    leftBtn.frame = CGRectMake(0, 0, 25,25);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"back_img"] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(leftBarBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.view.backgroundColor = [UIColor colorWithRed:0.92f green:0.92f blue:0.93f alpha:1.00f];
    
    UIButton * rightBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    rightBtn.frame = CGRectMake(0, 0, 40,25);
    rightBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    rightBtn.layer.masksToBounds = YES;
    rightBtn.layer.borderWidth = 1;
    rightBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    rightBtn.layer.cornerRadius = 3;
    rightBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [rightBtn setTitle:@"上传" forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [rightBtn setBackgroundColor:[UIColor colorWithRed:0.18f green:0.52f blue:0.77f alpha:1.00f]];
    [rightBtn addTarget:self action:@selector(rightBarBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    mainCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    [self.view addSubview:mainCollectionView];
    mainCollectionView.backgroundColor = [UIColor clearColor];
    
    //3.注册collectionViewCell
    //注意，此处的ReuseIdentifier 必须和 cellForItemAtIndexPath 方法中 一致 均为 cellId
    [mainCollectionView registerClass:[uoLoadingCollectionViewCell class] forCellWithReuseIdentifier:@"cellId"];
    [mainCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView"];
    
    mainCollectionView.delegate = self;
    mainCollectionView.dataSource = self;
    
    mainCollectionView.allowsMultipleSelection = YES;
   
}

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 14;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    uoLoadingCollectionViewCell *cell = (uoLoadingCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"cellId" forIndexPath:indexPath];
    
    NSString* str1 = [NSString stringWithFormat:@"1.jpg"];
    NSString* str2 = [NSString stringWithFormat:@"2.jpg"];
    NSString* str3 = [NSString stringWithFormat:@"3.jpg"];
    NSString* str4 = [NSString stringWithFormat:@"4.jpg"];
    NSString* str5 = [NSString stringWithFormat:@"5.jpg"];
    NSString* str6 = [NSString stringWithFormat:@"6.jpg"];
    NSString* str7 = [NSString stringWithFormat:@"7.jpg"];
    NSString* str8 = [NSString stringWithFormat:@"8.jpg"];
    NSString* str9 = [NSString stringWithFormat:@"9.jpg"];
    NSString* str10 = [NSString stringWithFormat:@"10.jpg"];
    NSString* str11 = [NSString stringWithFormat:@"11.jpg"];
    NSString* str12 = [NSString stringWithFormat:@"12.jpg"];
    NSString* str14 = [NSString stringWithFormat:@"13.jpg"];
    NSString* str15 = [NSString stringWithFormat:@"14.jpg"];
    
    NSArray* sec = [NSArray arrayWithObjects:str1, str2, str3, str4, str5, str6, str7, str8, str9, str10, str11, str12, str14, str15, nil];
    cell.topImage.image = [UIImage imageNamed:[sec objectAtIndex:indexPath.item]];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(100, 100);
}

///处置间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 2;
}

//水平间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 2;
}

//点击item的方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    uoLoadingCollectionViewCell *cell = (uoLoadingCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    UIImageView *ImageView = [[UIImageView alloc] init];
    ImageView.frame = CGRectMake(80, 15, 20, 20);
    ImageView.image = [UIImage imageNamed:@"my_button_pressed"];
    [cell.topImage addSubview:ImageView];
    
    
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    uoLoadingCollectionViewCell *cell = (uoLoadingCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [cell.topImage.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
}



- (void)leftBarBtnClicked:(UIButton *)btn {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightBarBtnClicked:(UIButton *)btn
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"确定上传所选内容" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
//    //修改title
//    NSMutableAttributedString *alertControllerStr = [[NSMutableAttributedString alloc] initWithString:@""];
//    //设置颜色
//    [alertControllerStr addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(0, alertControllerStr.length)];
//    //设置大小
//    [alertControllerStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:18] range:NSMakeRange(0, alertControllerStr.length)];
//    //替换title
//    [alertController setValue:alertControllerStr forKey:@"attributedTitle"];

    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDestructive handler:nil];
    [alertController addAction:cancelAction];
    [alertController addAction:deleteAction];
    [self presentViewController:alertController animated:YES completion:nil];
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
