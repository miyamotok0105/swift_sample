//
//  ViewController.swift
//  MetalKit001
//
//  Created by USER on 2017/12/03.
//  Copyright © 2017年 USER. All rights reserved.
//

import UIKit
import MetalKit

class ViewController: UIViewController, MTKViewDelegate {

    private let device = MTLCreateSystemDefaultDevice()!
    private var commandQueue: MTLCommandQueue!
    private var texture: MTLTexture!
    
    @IBOutlet private weak var mtkView: MTKView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMetal()
        loadTexture()
        mtkView.enableSetNeedsDisplay = true
        
        // ビューの更新依頼 → draw(in:)が呼ばれる
        mtkView.setNeedsDisplay()
    }

    private func setupMetal() {
        // MTLCommandQueueを初期化
        commandQueue = device.makeCommandQueue()
        
        // MTKViewのセットアップ
        mtkView.device = device
        mtkView.delegate = self
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
        // ドローアブルを取得
//        let drawable = CAMetalDrawable()        // ビルドエラー
        guard let drawable = view.currentDrawable else {return}
        
        // コマンドバッファを作成
        guard let commandBuffer = commandQueue.makeCommandBuffer() else {fatalError()}
        
        //        drawable.texture = texture              // ビルドエラー
        print(drawable.texture.width)
        print(texture.width)
        
        // コピーするサイズを計算
        let w = min(texture.width, drawable.texture.width)
        let h = min(texture.height, drawable.texture.height)
        //        print("texture: \(texture)\ndrawable.texture: \(drawable.texture)")
        // MTLBlitCommandEncoderを作成
        guard let blitEncoder = commandBuffer.makeBlitCommandEncoder() else {fatalError()}
        
        // コピーコマンドをエンコード
        blitEncoder.copy(from: texture,         // コピー元テクスチャ
            sourceSlice: 0,
            sourceLevel: 0,
            sourceOrigin: MTLOrigin(x: 0, y: 0, z: 0),
            sourceSize: MTLSizeMake(w, h, texture.depth),
            to: drawable.texture,  // コピー先テクスチャ
            destinationSlice: 0,
            destinationLevel: 0,
            destinationOrigin: MTLOrigin(x: 0, y: 0, z: 0))
        
        // エンコード完了
        blitEncoder.endEncoding()
        
        // 表示するドローアブルを登録
        commandBuffer.present(drawable)
        
        // コマンドバッファをコミット（エンキュー）
        commandBuffer.commit()
        
        // 完了まで待つ
        commandBuffer.waitUntilCompleted()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

