//
//  ViewController4.metal
//  MetalKit001
//
//  Created by USER on 2017/12/03.
//  Copyright © 2017年 USER. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;

//頂点シェーダー関数
//[[]]で囲まれたのは属性修飾子
struct ColorInOut
{
    float4 position [[ position ]];
};

vertex ColorInOut vertexShader(device float4 *positions [[ buffer(0) ]],
                               uint           vid       [[ vertex_id ]])
{
    ColorInOut out;
    out.position = positions[vid];
    return out;
}

fragment float4 fragmentShader(ColorInOut in [[ stage_in ]])
{
    return float4(1,0,0,1);
}

