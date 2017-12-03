//
//  ViewController3.swift
//  MetalKit001
//
//  Created by USER on 2017/12/03.
//  Copyright © 2017年 USER. All rights reserved.
//

//https://qiita.com/yuky_az/items/ece9b64befc635e89f1a

import UIKit
import Metal

//配列要素のバイト数を取得
private extension Array {
    var byteLength: Int {
        return self.count * MemoryLayout.size(ofValue: self[0])
    }
}

class ViewController3: UIViewController {

    let inputDataCount = 100
    
    var device: MTLDevice! //gpu操作
    var defaultLibrary: MTLLibrary!
    var commandQueue: MTLCommandQueue! //コマンド実行を管理
    //MTLFunctionがMetalシェーディング言語で書かれた演算処理。
    var computePipelineState: MTLComputePipelineState! //MTLFunctionをコンパイルされたコードに変換
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //初期化
        device = MTLCreateSystemDefaultDevice()
        defaultLibrary = device.makeDefaultLibrary()
        commandQueue = device.makeCommandQueue()
        let ml2Func = defaultLibrary.makeFunction(name: "addOne")! //metalのaddOne関数を呼ぶ
        computePipelineState = try! device.makeComputePipelineState(function: ml2Func)
    }

    @IBAction func calculate(_ sender: Any) {
        //入力データ
        var inputData:[Float] = []
        for _ in 0...inputDataCount-1 {
            inputData.append(Float(arc4random_uniform(UInt32(inputDataCount))))
        }
        
        //コマンドバッファとエンコーダの作成と設定
        let commandBuffer = commandQueue.makeCommandBuffer()
        let computeCommandEncoder = commandBuffer?.makeComputeCommandEncoder()
        computeCommandEncoder?.setComputePipelineState(computePipelineState)
        
        //入力バッファの作成と設定
        let inputDataBuffer = device.makeBuffer(bytes: inputData, length: inputData.byteLength, options: [])
        computeCommandEncoder?.setBuffer(inputDataBuffer, offset: 0, index: 0)
        
        //出力バッファの作成と設定
        let outputData = [Float](repeating: 0, count: inputData.count)
        let outputDataBuffer = device.makeBuffer(bytes: outputData, length: outputData.byteLength, options: [])
        computeCommandEncoder?.setBuffer(outputDataBuffer, offset: 0, index: 1)
        
        //スレッドグループの数、スレッドグループ内のスレッドの数を設定。これにより並列で実行される演算数が決定される
        let width = 64
        let threadsPerGroup = MTLSize(width: width, height: 1, depth: 1)
        let numThreadgroups = MTLSize(width: (inputData.count + width - 1) / width, height: 1, depth: 1)
        computeCommandEncoder?.dispatchThreadgroups(numThreadgroups, threadsPerThreadgroup: threadsPerGroup)
        
        //エンコーダーからのコマンドは終了
        computeCommandEncoder?.endEncoding()
        
        //コマンドバッファを実行し、完了するまで待機
        commandBuffer?.commit()
        commandBuffer?.waitUntilCompleted()
        
        //結果をresultDataに格納
        let data = Data(bytesNoCopy: (outputDataBuffer?.contents())!, count: outputData.byteLength, deallocator: .none)
        var resultData = [Float](repeating: 1, count: outputData.count)
        resultData = data.withUnsafeBytes {
            Array(UnsafeBufferPointer<Float>(start: $0, count: data.count/MemoryLayout<Float>.size))
        }
        
        //結果の表示
        print("[Input data]: \(inputData)")
        print("[Result data]: \(resultData)")
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
