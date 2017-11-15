//
//  ViewController.h
//  PlaneDetectionVisualization
//
//  Created by iot on 2017/11/15.
//  Copyright © 2017年 iot. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <SceneKit/SceneKit.h>
#import <ARKit/ARKit.h>
#import "Plane.h"

@interface ViewController : UIViewController
- (void)setupScene;
- (void)setupSession;
@property NSMutableDictionary *planes;
@end

