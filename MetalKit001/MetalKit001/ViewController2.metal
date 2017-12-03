//
//  ViewController2.metal
//  MetalKit001
//
//  Created by USER on 2017/12/03.
//  Copyright © 2017年 USER. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;

// Rec 709 LUMA values for grayscale image conversion
constant float3 kRec709Luma = float3(0.2126, 0.7152, 0.0722);

struct Vertex {
    float4 position [[position]];
    float4 color;
};

vertex Vertex vertex_func(constant Vertex *vertices [[buffer(0)]],
                          uint vid [[vertex_id]]) {
    return vertices[vid];
}

fragment float4 fragment_func(Vertex vert [[stage_in]]) {
    float3 inColor = float3(vert.color.x, vert.color.y, vert.color.z);
    half gray = dot(kRec709Luma, inColor);
    float4 outColor = float4(gray, gray, gray, 1);
    return outColor;
}



