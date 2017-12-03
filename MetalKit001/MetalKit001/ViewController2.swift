//
//  ViewController2.swift
//  MetalKit001
//
//  Created by USER on 2017/12/03.
//  Copyright © 2017年 USER. All rights reserved.
//

//三角を描写しようとしてるが。。。

import UIKit
import MetalKit

struct Vertex {
    var position: vector_float4
    var color: vector_float4
}

class MetalView: MTKView {
    
    override func draw(_ dirtyRect: CGRect) {
        super.draw(dirtyRect)
        self.device = MTLCreateSystemDefaultDevice()
        guard let device = self.device else {
            NSLog("Failed to create Metal device")
            return
        }
        let vertexData = [Vertex(position: [-1.0, -1.0, 0.0, 1.0], color: [1, 0, 0, 1]),
                          Vertex(position: [ 0.0, -1.0, 0.0, 1.0], color: [0, 1, 0, 1]),
                          Vertex(position: [-0.5,  1.0, 0.0, 1.0], color: [0, 0, 1, 1]),]
        let vertexBuffer = device.makeBuffer(bytes: vertexData, length: MemoryLayout.size(ofValue: vertexData[0]) * vertexData.count, options:[])
        
        guard let library = device.makeDefaultLibrary() else {
            NSLog("Failed to create library")
            return
        }
        let vertexFunction = library.makeFunction(name: "vertex_func")
        let fragmentFunction = library.makeFunction(name: "fragment_func")
        let renderPipelineDescriptor = MTLRenderPipelineDescriptor()
        renderPipelineDescriptor.vertexFunction = vertexFunction
        renderPipelineDescriptor.fragmentFunction = fragmentFunction
        renderPipelineDescriptor.colorAttachments[0].pixelFormat = .bgra8Unorm
        do {
            let renderPipelineState = try device.makeRenderPipelineState(descriptor: renderPipelineDescriptor)
            guard let renderPassDescriptor = self.currentRenderPassDescriptor, let drawable = self.currentDrawable else {
                return
            }
            
            renderPassDescriptor.colorAttachments[0].clearColor = MTLClearColorMake(0, 0.7, 0, 1.0)
            let commandBuffer = device.makeCommandQueue()?.makeCommandBuffer()
            let renderCommandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: renderPassDescriptor)
            renderCommandEncoder?.setRenderPipelineState(renderPipelineState)
            renderCommandEncoder?.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
            renderCommandEncoder?.drawPrimitives(type: MTLPrimitiveType.triangle, vertexStart: 0, vertexCount: 3)
//            renderCommandEncoder?.drawPrimitives(.Triangle, vertexStart: 0, vertexCount: 3, instanceCount: 1)
            renderCommandEncoder?.endEncoding()
            commandBuffer?.present(drawable)
            commandBuffer?.commit()
        } catch let error {
            NSLog("\(error)")
        }
    }
}

class ViewController2: UIViewController {
    
    @IBOutlet weak var mtlView: MTKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mtlView = MetalView.init()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
