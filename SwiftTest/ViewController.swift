//
//  ViewController.swift
//  SwiftTest
//
//  Created by 千葉　諒 on 2020/07/18.
//  Copyright © 2020 chiba. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate{

    @IBOutlet weak var computerImage: UIImageView!
    @IBOutlet weak var imageGu: UIImageView!
    @IBOutlet weak var imagePa: UIImageView!
    @IBOutlet weak var imageChoki: UIImageView!
    @IBOutlet weak var status: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // タップ判定を追加
        imageGu.addGestureRecognizer(UITapGestureRecognizer(
        target: self,
        action: #selector(ViewController.tapped(_:))))
        imagePa.addGestureRecognizer(UITapGestureRecognizer(
        target: self,
        action: #selector(ViewController.tapped(_:))))
        imageChoki.addGestureRecognizer(UITapGestureRecognizer(
        target: self,
        action: #selector(ViewController.tapped(_:))))
    }

    // タップ判定
    @objc func tapped(_ sender: UITapGestureRecognizer){
        // 自分が出した手の判定
        guard let myTag = sender.view?.tag else { return }
        // CPUの出す手の判定
        let cpuTag = Int.random(in: 0..<3)

        // CPUの画像を変更
        var image: UIImage?
        if(cpuTag == 0) {
            image =  UIImage(named:"gu")!
        } else if(cpuTag ==  1) {
            image =  UIImage(named:"pa")!
        } else {
            image =  UIImage(named:"choki")!
        }
        computerImage.image = image
        
        // 勝敗判定(0:勝ち、1:負け、2:あいこ)
        let matchType = match(myTag: myTag, cpuTag: cpuTag)
        // ラベルの変更
        if(matchType == 0) {
            status.text = "Yow Win!!"
        } else if(matchType == 1) {
            status.text = "Yow Loss"
        } else if(matchType == 2) {
            status.text = "あいこで！"
        } else {
            status.text = "値の取得に失敗しましたr"
        }
    }
    
    func match(myTag: Int, cpuTag: Int) -> Int {
        switch myTag {
        case 0:
            if(cpuTag == 0) {
                return 2
            } else if( cpuTag == 1) {
                return 1
            } else {
                return 0
            }
        case 1:
            if(cpuTag == 0) {
                return 0
            } else if( cpuTag == 1) {
                return 2
            } else {
                return 1
            }
        case 2:
            if(cpuTag == 0) {
                return 1
            } else if( cpuTag == 1) {
                return 0
            } else {
                return 2
            }
        default:
            return 3
        }
    }
}
