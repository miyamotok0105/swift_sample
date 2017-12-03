//
//  ViewController.swift
//  MetalKit001
//
//  Created by USER on 2017/12/03.
//  Copyright © 2017年 USER. All rights reserved.
//

//赤色に背景を変える

import UIKit
import MetalKit

class ViewController4: UIViewController, MTKViewDelegate {
    
    private let device = MTLCreateSystemDefaultDevice()!
    private var commandQueue: MTLCommandQueue!
    private var texture: MTLTexture!
    
    private let vertexData: [Float] = [
        -1, -1, 0, 1,
        1, -1, 0, 1,
        -1,  1, 0, 1,
        1,  1, 0, 1
    ]
    private var vertexBuffer: MTLBuffer!
    private var renderPipeline: MTLRenderPipelineState!
    private let renderPassDescriptor = MTLRenderPassDescriptor()
    
    @IBOutlet private weak var mtkView: MTKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMetal()
        makeBuffers()
        makePipeline()
//        loadTexture()
        mtkView.enableSetNeedsDisplay = true
        
        // ビューの更新依頼 → draw(in:)が呼ばれる
        mtkView.setNeedsDisplay()
    }
    
    private func setupMetal() {
        commandQueue = device.makeCommandQueue()
        mtkView.device = device
        mtkView.delegate = self
    }
    
    private func makeBuffers() {
        let size = vertexData.count * MemoryLayout<Float>.size
        vertexBuffer = device.makeBuffer(bytes: vertexData, length: size, options: [])
    }
    
    private func makePipeline() {
        guard let library = device.makeDefaultLibrary() else {fatalError()}
        let descriptor = MTLRenderPipelineDescriptor()
        descriptor.vertexFunction = library.makeFunction(name: "vertexShader") //レンダリングパス内の個々の頂点
        descriptor.fragmentFunction = library.makeFunction(name: "fragmentShader")
        descriptor.colorAttachments[0].pixelFormat = .bgra8Unorm
        renderPipeline = try! device.makeRenderPipelineState(descriptor: descriptor)
    }
    
    private func loadTexture() {
        // MTKTextureLoaderを初期化
        let textureLoader = MTKTextureLoader(device: device)
        // テクスチャをロード
        texture = try! textureLoader.newTexture(
            name: "lena",
            scaleFactor: view.contentScaleFactor,
            bundle: nil)
        
        // ピクセルフォーマットを合わせる
        mtkView.colorPixelFormat = texture.pixelFormat
    }
    
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        print("\(self.classForCoder)/" + #function)
    }
    
    //デフォルトでは内部のタイマによって自動的に再描画されdrawが呼ばれる
    func draw(in view: MTKView) {
        guard let drawable = view.currentDrawable else {return}
        guard let commandBuffer = commandQueue.makeCommandBuffer() else {fatalError()}
        renderPassDescriptor.colorAttachments[0].texture = drawable.texture
        guard let renderEncoder = commandBuffer.makeRenderCommandEncoder(descriptor: renderPassDescriptor) else {return}
        guard let renderPipeline = renderPipeline else {fatalError()}
        renderEncoder.setRenderPipelineState(renderPipeline)
        renderEncoder.setVertexBuffer(vertexBuffer, offset: 0, index: 0)
        renderEncoder.drawPrimitives(type: .triangleStrip, vertexStart: 0, vertexCount: 4)
        renderEncoder.endEncoding()
        
        commandBuffer.present(drawable)
        commandBuffer.commit()
        commandBuffer.waitUntilCompleted()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

