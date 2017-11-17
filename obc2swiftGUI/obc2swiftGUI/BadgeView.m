//
//  BadgeView.m
//  obc2swiftGUI
//
//  Created by iot on 2017/11/17.
//  Copyright © 2017年 USER. All rights reserved.
//

#import "BadgeView.h"

@implementation BadgeView


- (id)init
{
    self = [super init];
    

    //class name
    NSLog(@" %@ ",[[self class] description]);
    
    //これは反映されないんだね。
    self.backgroundColor = [UIColor redColor];
    
    //ラベル
    UILabel *firstLabel = [[UILabel alloc] init];
    int screenWidth = self.frame.size.width;
    NSLog(@"screenWidth %d ",screenWidth);
//    firstLabel.frame = CGRectMake((screenWidth/2 - 150/2), 100, 150, 20);
    firstLabel.frame = CGRectMake(0, 100, 150, 20);
    firstLabel.text = @"BadgeView Screen";
    firstLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:firstLabel];
    
    //ラベル
    UILabel *Label2 = [[UILabel alloc] init];
    screenWidth = self.frame.size.width;
    NSLog(@"screenWidth %d ",screenWidth);
    //    firstLabel.frame = CGRectMake((screenWidth/2 - 150/2), 100, 150, 20);
    Label2.frame = CGRectMake(0, 200, 150, 20);
    Label2.text = @"BadgeView Screen";
    Label2.textAlignment = NSTextAlignmentCenter;
    [self addSubview:Label2];
    
    
    
    return self;
}

- (void)layoutToView:(UIView *)parent withValue:(NSString *)value
{
//    UILabel *badge = self;
//    badge.text = value;
//    [badge sizeToFit];
//    badge.width = MIN(22, badge.width + 8 + 8);
//    badge.x = 11.0;
//    badge.y = -18 + (9.25) + 4;
}

- (void)layoutToView:(UIView *)parent withUInteger:(NSUInteger)value
{
//    NSString *val = [NSString stringWithFormat:@"%lu", value];
//    [self layoutToView:parent withValue:val];
}


@end
