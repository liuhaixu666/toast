//
//  ViewController.m
//  Toast 吐丝
//
//  Created by mac on 2018/4/28.
//  Copyright © 2018年 mac. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Toast.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableview;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableview.delegate =self;
    self.tableview.dataSource = self;
    self.tableview.estimatedRowHeight = 44;
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.textLabel.text = @"吐丝jdlajsdljaldjalksdjlkasjdlkasjdklaslkcklaskasdkljdkladjsalkjsldkjalskdjklasdjasdjklasjlj撒大飒飒是的撒啊飒飒大萨达撒大家就打了多久了多久爱丽丝吐丝";
    cell.textLabel.numberOfLines = 0;
//    cell.backgroundColor = [UIColor redColor];
    return cell;
}
#pragma mark - UITableViewDelegate
// 组数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
// 头高header_height
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 1;
}
// 尾高footer_height
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 1;
}
// 头部view
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [UIView new];
}
// 尾部view
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return [UIView new];
}
// 点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        [self.tableview makeToast:@"11111"];
    }else if (indexPath.row == 1){
        CSToastStyle *style = [CSToastManager sharedStyle];
        style.messageFont = [UIFont fontWithName:@"Zapfino" size:14.0];
        style.messageColor = [UIColor redColor];
        style.messageAlignment = NSTextAlignmentCenter;
        style.backgroundColor = [UIColor yellowColor];
        
        UIView *view =  [self.tableview toastViewForMessage:@"你好湿哒哒所多所" title:@"世界范德萨发生大幅度盛世嫡妃" image:[UIImage imageNamed:@"timg.jpeg"] style:style];
        [self.tableview showToast:view];
    }else if (indexPath.row == 2){
        
        [self.tableview makeToast:@"1111" duration:2.0 position:CSToastPositionCenter];
        
    }else if (indexPath.row== 3){
        CSToastStyle *style = [CSToastManager sharedStyle];
        style.messageFont = [UIFont fontWithName:@"Zapfino" size:14.0];
        style.messageColor = [UIColor redColor];
        style.messageAlignment = NSTextAlignmentCenter;
        style.backgroundColor = [UIColor yellowColor];
        [self.tableview makeToast:@"D沙发发顺丰独山大道" duration:2.0 position:CSToastPositionCenter title:@"方式萨芬撒打算打算" image:[UIImage imageNamed:@"timg.jpeg"] style:style completion:^(BOOL didTap) {
            if (didTap) {
                NSLog(@"completion from tap");
            } else {
                NSLog(@"completion without tap");
            }
        }];
        
        
    }else if (indexPath.row == 4){
        
        [self.tableview hideAllToasts];
        
    }



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
