//
//  ViewController2.m
//  obc2swiftGUI
//
//  Created by USER on 2017/11/17.
//  Copyright © 2017年 USER. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //ラベル
    UILabel *firstLabel = [[UILabel alloc] init];
    int screenWidth = self.view.frame.size.width;
    
    firstLabel.frame = CGRectMake((screenWidth/2 - 150/2), 100, 150, 20);
    firstLabel.text = @"ViewController2 Screen";
    firstLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:firstLabel];
    
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
