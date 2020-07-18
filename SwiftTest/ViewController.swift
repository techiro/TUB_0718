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
        let myHand = returnHand(myTag)
        // CPUの出す手の判定
        let cpuTag = Int.random(in: 0..<3)
        let cpuHand = returnHand(cpuTag)
        // CPUの画像を変更
        var image: UIImage?
        switch cpuHand {
        case .gu:
            image =  UIImage(named:"gu")!
        case .tyoki:
           image =  UIImage(named:"choki")!
        case.pa:
           image = UIImage(named:"pa")!
        }

        computerImage.image = image
        
        // 勝敗判定(2:勝ち、1:負け、0:あいこ)
        let judge = judgeLogic(myHand: myHand, cpuHand: cpuHand)
        
        switch judge {
        case .win:
            status.text = "Yow Win!!"
        case .lose:
            status.text = "You Loss"
        case.draw:
            status.text = "あいこで！"
        }
        
    }
    
    func returnHand(_ Tag:Int)->Hand{
        return Hand(rawValue: Tag)!
    }
    
    func judgeLogic(myHand: Hand , cpuHand: Hand) ->Judge{
        return Judge(rawValue: (myHand.rawValue-cpuHand.rawValue+3)%3)!
        /*
        winの場合 myHand: gu(0) cpuHand: tyoki(2) (0-2+3)%3 = 2
        loseの場合 myHand: gu(0) cpuHand: pa(1) (0-1+3)%3 = 1
        drawの場合 myHand: gu(0) cpuHand: tyoki(0) (0-0+3)%3 = 0
        */
    }

}
