//
//  ViewController.m
//  PlaneDetectionVisualization
//
//  Created by iot on 2017/11/15.
//  Copyright © 2017年 iot. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <ARSCNViewDelegate>

//ARSCNViewはAR用のビュー
@property (nonatomic, strong) IBOutlet ARSCNView *sceneView;

@end

    
@implementation ViewController

//インスタンス化された直後（初回に一度のみ）
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupScene];
}
//画面が表示される直前
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setupSession];

}
//別の画面に遷移した直後
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // Pause the view's session
    [self.sceneView.session pause];
}

- (void)setupScene {
    // Setup the ARSCNViewDelegate - this gives us callbacks to handle new
    // geometry creation
    self.sceneView.delegate = self;
    
    // A dictionary of all the current planes being rendered in the scene
    self.planes = [NSMutableDictionary new];
    
    // Show statistics such as fps and timing information
    self.sceneView.showsStatistics = YES;
    self.sceneView.autoenablesDefaultLighting = YES;
    
    //ARKitのデバッグモード。トラッキングで特徴を表示する。
    self.sceneView.debugOptions =
    ARSCNDebugOptionShowWorldOrigin |
    ARSCNDebugOptionShowFeaturePoints;
    //SCNSceneは3Dシーンを構成する属性を持つ。
    SCNScene *scene = [SCNScene new];
    self.sceneView.scene = scene;
}

- (void)setupSession {
    // 後ろのカメラを使用し、デバイスの向きと位置を追跡し、平面を検出するオブジェクト。
    ARWorldTrackingConfiguration *configuration = [ARWorldTrackingConfiguration new];
    
    // planeDetectionで平坦を検出する
    configuration.planeDetection = ARPlaneDetectionHorizontal;
    
    // セッションを実行
    [self.sceneView.session runWithConfiguration:configuration];
}

//rendererは平面が検出された時に呼ばれる。
- (void)renderer:(id <SCNSceneRenderer>)renderer didAddNode:(SCNNode *)node forAnchor:(ARAnchor *)anchor {
    if (![anchor isKindOfClass:[ARPlaneAnchor class]]) {
        return;
    }
    
    // When a new plane is detected we create a new SceneKit plane to visualize it in 3D
    Plane *plane = [[Plane alloc] initWithAnchor: (ARPlaneAnchor *)anchor];
    [self.planes setObject:plane forKey:anchor.identifier];
    [node addChildNode:plane];
}

//didUpdateNodeは移動などしてシーンがレンダリングされて時に呼ばれる
- (void)renderer:(id <SCNSceneRenderer>)renderer didUpdateNode:(SCNNode *)node forAnchor:(ARAnchor *)anchor {
    Plane *plane = [self.planes objectForKey:anchor.identifier];
    if (plane == nil) {
        return;
    }
    
    // When an anchor is updated we need to also update our 3D geometry too. For example
    // the width and height of the plane detection may have changed so we need to update
    // our SceneKit geometry to match that
    [plane update:(ARPlaneAnchor *)anchor];
}

//didRemoveNodeは平坦の検出がなくなった時に呼ばれる
- (void)renderer:(id <SCNSceneRenderer>)renderer didRemoveNode:(SCNNode *)node forAnchor:(ARAnchor *)anchor {
    // Nodes will be removed if planes multiple individual planes that are detected to all be
    // part of a larger plane are merged.
    [self.planes removeObjectForKey:anchor.identifier];
}

/**
 Called when a node will be updated with data from the given anchor.
 
 @param renderer The renderer that will render the scene.
 @param node The node that will be updated.
 @param anchor The anchor that was updated.
 */
- (void)renderer:(id <SCNSceneRenderer>)renderer willUpdateNode:(SCNNode *)node forAnchor:(ARAnchor *)anchor {
}

- (void)session:(ARSession *)session didFailWithError:(NSError *)error {
    // Present an error message to the user
}

- (void)sessionWasInterrupted:(ARSession *)session {
    // Inform the user that the session has been interrupted, for example, by presenting an overlay
}

- (void)sessionInterruptionEnded:(ARSession *)session {
    // Reset tracking and/or remove existing anchors if consistent tracking is required
}

@end
