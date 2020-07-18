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
    
    func testWin() {

    }
    
    func testLoss() {
        
    }

    func testDraw() {
        
    }
    
    func testError() {
        
    }
}
