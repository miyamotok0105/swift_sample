//
//  Plane.h
//  PlaneDetectionVisualization
//
//  Created by iot on 2017/11/15.
//  Copyright © 2017年 iot. All rights reserved.
//

#import <SceneKit/SceneKit.h>
#import <ARKit/ARKit.h>

@interface Plane : SCNNode
- (instancetype)initWithAnchor:(ARPlaneAnchor *)anchor;
- (void)update:(ARPlaneAnchor *)anchor;
- (void)setTextureScale;
@property (nonatomic,retain) ARPlaneAnchor *anchor;
@property (nonatomic, retain) SCNPlane *planeGeometry;
@end

