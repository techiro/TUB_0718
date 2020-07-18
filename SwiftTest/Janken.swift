//
//  Janken.swift
//  SwiftTest
//
//  Created by TanakaHirokazu on 2020/07/18.
//  Copyright © 2020 chiba. All rights reserved.
//

enum Hand: Int{
    case gu = 0
    case pa = 1
    case tyoki = 2
    
}

enum Judge: Int{
    /*
    judgeLogicから
    drawの場合 myHand: gu(0) cpuHand: gu(2) (0-0+3)%3 = 0
    winの場合 myHand: gu(0) cpuHand: tyoki(2) (0-2+3)%3 = 1
    loseの場合 myHand: gu(0) cpuHand: pa(1) (0-1+3)%3 = 2
    */
    
    case draw = 0
    case win = 1
    case lose = 2
    
}
