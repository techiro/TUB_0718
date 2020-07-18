//
//  SwiftTestTests.swift
//  SwiftTestTests
//
//  Created by 千葉　諒 on 2020/07/18.
//  Copyright © 2020 chiba. All rights reserved.
//

import XCTest
@testable import SwiftTest

class SwiftTestTests: XCTestCase {

    /* じゃんけんの手
     グー：0
     パー：1
     チョキ：2
    */
    /*
     勝敗ステータス
     0:勝ち
     1:負け
     2:引き分け
     3:エラー
     */
    var viewController: ViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.viewController = storyboard.instantiateInitialViewController() as? ViewController
    }

    override func tearDown() {
        super.tearDown()
    }
    
    /*enum Hand: Int{
        case gu = 0
        case pa = 1
        case tyoki = 2
    }
   */
    
    func testWin() {
        //手が合っているかのテスト
        let hand1 = viewController.returnHand(0)
        XCTAssertEqual(hand1, Hand.gu)
        let hand2 = viewController.returnHand(1)
        XCTAssertEqual(hand2, Hand.pa)
        let hand3 = viewController.returnHand(2)
        XCTAssertEqual(hand3, Hand.tyoki)

        //Logicが合っているかのテスト
        let win1 = viewController.judgeLogic(myHand: Hand.gu, cpuHand: Hand.tyoki)
        XCTAssertEqual(win1, Judge.win)
    }
    
    func testLose() {
        //Logicが合っているかのテスト
        let lose1 = viewController.judgeLogic(myHand: Hand.gu, cpuHand: Hand.pa)
        XCTAssertEqual(lose1, Judge.lose)
    }

    func testDraw() {
        let draw1 = viewController.judgeLogic(myHand: Hand(rawValue: 1)!, cpuHand: Hand(rawValue: 1)!)
        XCTAssertEqual(draw1, Judge.draw)
        
    }
    
    func testError() {

    }
}
