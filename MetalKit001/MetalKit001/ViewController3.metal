//
//  ViewController3.metal
//  MetalKit001
//
//  Created by USER on 2017/12/03.
//  Copyright © 2017年 USER. All rights reserved.
//

#include <metal_stdlib>
using namespace metal;

kernel void addOne(const device float *inputData [[ buffer(0) ]],
                   device float *outputData [[ buffer(1) ]],
                   uint id [[ thread_position_in_grid ]])
{
    float result = inputData[id];
    result += 1.0f;
    outputData[id] = result;
}


