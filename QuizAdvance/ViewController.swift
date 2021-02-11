//
//  ViewController.swift
//  QuizAdvance
//
//  Created by nullworkbench on 2021/02/10.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 初回起動かチェック
        if UserDefaults.standard.object(forKey: "isFirstLaunch") == nil {
            // デフォルトのクイズを保存する
            let quizArray: [[Any]] = [
                ["SwiftとXcodeで制作できるものは？", "Androidアプリ", "iOSアプリ", "Webアプリ", 2],
                ["文字列を示す型は？", "String", "Int", "Float", 1],
                ["1 + 1の答えを出力するのは？", "print(\"1\" + \"1\")", "print(1 + 1)", "print(\"1 + 1\")", 2]
            ]
            
            // UserDefaultsに保存
            UserDefaults.standard.set(quizArray, forKey: "quizArray")
            UserDefaults.standard.set(false, forKey: "isFirstLaunch")
        }
        
        
    }


}

