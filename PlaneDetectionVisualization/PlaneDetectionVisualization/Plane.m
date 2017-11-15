//
//  Plane.m
//  PlaneDetectionVisualization
//
//  Created by iot on 2017/11/15.
//  Copyright © 2017年 iot. All rights reserved.
//

#import "Plane.h"


//平坦情報保持用のオブジェクト
@implementation Plane

//クラス初期化用。
- (instancetype)initWithAnchor:(ARPlaneAnchor *)anchor {
    self = [super init];
    
    self.anchor = anchor;
    //planeWithWidthで指定された幅と高さを持つ平面ジオメトリを作成します。
    //planeGeometryは平面ジオメトリ
    self.planeGeometry = [SCNPlane planeWithWidth:anchor.extent.x height:anchor.extent.z];
    
    // グリッドの代わりにtron_gridを表示する。
    SCNMaterial *material = [SCNMaterial new];
    UIImage *img = [UIImage imageNamed:@"tron_grid"];
    material.diffuse.contents = img;
    self.planeGeometry.materials = @[material];
    
    SCNNode *planeNode = [SCNNode nodeWithGeometry:self.planeGeometry];
    planeNode.position = SCNVector3Make(anchor.center.x, 0, anchor.center.z);
    
    // Planes in SceneKit are vertical by default so we need to rotate 90degrees to match
    // planes in ARKit
    planeNode.transform = SCNMatrix4MakeRotation(-M_PI / 2.0, 1.0, 0.0, 0.0);
    
    [self setTextureScale];
    [self addChildNode:planeNode];
    return self;
}

//ユーザーが動き回ると平坦情報が更新される。
- (void)update:(ARPlaneAnchor *)anchor {
    self.planeGeometry.width = anchor.extent.x;
    self.planeGeometry.height = anchor.extent.z;
    
    // When the plane is first created it's center is 0,0,0 and the nodes
    // transform contains the translation parameters. As the plane is updated
    // the planes translation remains the same but it's center is updated so
    // we need to update the 3D geometry position
    self.position = SCNVector3Make(anchor.center.x, 0, anchor.center.z);
    [self setTextureScale];
}

//テクスチャのセット
- (void)setTextureScale {
    CGFloat width = self.planeGeometry.width;
    CGFloat height = self.planeGeometry.height;
    
    // As the width/height of the plane updates, we want our tron grid material to
    // cover the entire plane, repeating the texture over and over. Also if the
    // grid is less than 1 unit, we don't want to squash the texture to fit, so
    // scaling updates the texture co-ordinates to crop the texture in that case
    
    //SCNPlane：レンリング時のジオメトリ外観
    SCNMaterial *material = self.planeGeometry.materials.firstObject;
    //SCNMatrix4MakeScaleで行列のスケールを変換
    material.diffuse.contentsTransform = SCNMatrix4MakeScale(width, height, 1);
    material.diffuse.wrapS = SCNWrapModeRepeat;
    material.diffuse.wrapT = SCNWrapModeRepeat;
}
@end

