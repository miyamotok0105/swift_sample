//
//  ViewController.m
//  ARCube
//
//  Created by iot on 2017/11/15.
//  Copyright © 2017年 iot. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <ARSCNViewDelegate>

@property (nonatomic, strong) IBOutlet ARSCNView *sceneView;

@end

    
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //飛行機を削除
//    // Set the view's delegate
//    self.sceneView.delegate = self;
//    // Show statistics such as fps and timing information
//    self.sceneView.showsStatistics = YES;
//    // Create a new scene
//    SCNScene *scene = [SCNScene sceneNamed:@"art.scnassets/ship.scn"];
//    // Set the scene to the view
//    self.sceneView.scene = scene;
    

    //豆腐を貼り付け
    // Container to hold all of the 3D geometry
    SCNScene *scene = [SCNScene new];
    // The 3D cube geometry we want to draw
    SCNBox *boxGeometry = [SCNBox
                           boxWithWidth:0.1
                           height:0.1
                           length:0.1
                           chamferRadius:0.0];
    // The node that wraps the geometry so we can add it to the scene
    SCNNode *boxNode = [SCNNode nodeWithGeometry:boxGeometry];
    // Position the box just in front of the camera
    boxNode.position = SCNVector3Make(0, 0, -0.5);
    // rootNode is a special node, it is the starting point of all
    // the items in the 3D scene
    [scene.rootNode addChildNode: boxNode];
    // Set the scene to the view
    self.sceneView.scene = scene;
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Create a session configuration
    ARWorldTrackingConfiguration *configuration = [ARWorldTrackingConfiguration new];
    // Run the view's session
    [self.sceneView.session runWithConfiguration:configuration];
    
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // Pause the view's session
    [self.sceneView.session pause];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - ARSCNViewDelegate

/*
// Override to create and configure nodes for anchors added to the view's session.
- (SCNNode *)renderer:(id<SCNSceneRenderer>)renderer nodeForAnchor:(ARAnchor *)anchor {
    SCNNode *node = [SCNNode new];
 
    // Add geometry to the node...
 
    return node;
}
*/

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
