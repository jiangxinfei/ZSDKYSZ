//
//  ViewController.m
//  ZSDKYSZ
//
//  Created by YuanMedia on 2018/4/18.
//  Copyright © 2018年 YuanMedia. All rights reserved.
//

#import "ViewController.h"

#define SCREEN_WIDTH     [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT    [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)NSMutableArray * arrayDate;
@property (nonatomic,strong)UITableView    * myTableView;

@end

@implementation ViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    
    [self initUI];
}

#pragma mark --- 表
- (void)initUI{
    
    [self.view addSubview:self.myTableView];
}

- (UITableView *)myTableView{
    if (!_myTableView) {
        _myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        _myTableView.showsVerticalScrollIndicator = NO;
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
        _myTableView.sectionFooterHeight = 0.0f;
        [_myTableView  setSeparatorColor:[UIColor whiteColor]];  //设置分割线为bai色
        
    }
    return _myTableView;
}
#pragma mark --- 协议
/// 分区
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
/// 分行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}
/// 区头高
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10.0f;
}
/// 行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44.0f;
}

/// Cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIndentfier1 =@"cellIndentfier";
    UITableViewCell * cell =[tableView dequeueReusableCellWithIdentifier:cellIndentfier1];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentfier1];
    }
    cell.textLabel.text = @"备用的……";
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    return cell;
}
/// 点击cell
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

#pragma mark --- 懒加载
-(NSMutableArray *)arrayDate{
    if (!_arrayDate) {
        _arrayDate = [[NSMutableArray alloc]init];
    }
    return _arrayDate;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
