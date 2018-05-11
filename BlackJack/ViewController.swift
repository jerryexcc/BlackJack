//
//  ViewController.swift
//  BlackJack
//
//  Created by 世明 on 2018/5/4.
//  Copyright © 2018年 世明. All rights reserved.
//

import UIKit
import GameKit

class ViewController: UIViewController {
    @IBOutlet var playerPos: [UIImageView]!
    @IBOutlet var npcPos: [UIImageView]!
    @IBOutlet weak var cardStartPos: UIImageView!
    var playerHand = 0
    var playerHandCardArray = [String]()
    var pnpcHandCardArray = [String]()
    let card = ["card-a01", "card-a02", "card-a03", "card-a04", "card-a05", "card-a06", "card-a07", "card-a08", "card-a09", "card-a10", "card-a11", "card-a12", "card-a13"]
    
    //測試按鈕
    @IBOutlet var playerCardSet: [UIButton]!
    @IBOutlet var npcCardSet: [UIButton]!
    
    var btn: UIButton?
    var front: UIImageView!
    var back: UIImageView!
    
    var isOpen = false
    
    @IBAction func testBTNAct(_ sender: UIButton) {
        if sender.center.x == playerCardSet[0].center.x{
            if isOpen {
                isOpen = false
                playerCardSet[0].setBackgroundImage(#imageLiteral(resourceName: "card-e03"), for: .normal)
                UIView.transition(with: playerCardSet[0], duration: 1, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            }else{
                isOpen = true
                let pic: UIImage!
                pic = UIImage(named: card[GKRandomDistribution(lowestValue: 0, highestValue: 12).nextInt()])
                playerCardSet[0].setBackgroundImage(pic, for: .normal)
                UIView.transition(with: playerCardSet[0], duration: 1, options: .transitionFlipFromLeft, animations: nil, completion: nil)
            }
        } else {
            print("不能轉得牌")
        }
    }
    
    @IBAction func btnTestDismiss(_ sender: Any) {
        if playerCardSet[0].center.x != cardStartPos.frame.minX{
            for pos in 0...4{
                print("\(pos)")
                playerCardSet[pos].center.x = cardStartPos.center.x
                playerCardSet[pos].center.y = cardStartPos.center.y
                npcCardSet[pos].center.x = cardStartPos.center.x
                npcCardSet[pos].center.y = cardStartPos.center.y
                
                playerCardSet[pos].setBackgroundImage(#imageLiteral(resourceName: "card-e03"), for: .normal)
                npcCardSet[pos].setBackgroundImage(#imageLiteral(resourceName: "card-e03"), for: .normal)
            }
            self.playerHand = 0
        }else{
            print("沒有牌")
        }
    }
    @IBAction func btnGiveAct(_ sender: Any) {
        switch self.playerHand{
        case 0:
            self.playerHand += 1
            self.giveCard(player: "player", position: 0)
            self.giveCard(player: "ncp", position: 0)
            self.giveCard(player: "player", position: 1)
            self.giveCard(player: "ncp", position: 1)
        case 1:
            self.playerHand += 1
            self.giveCard(player: "player", position: 2)
            self.giveCard(player: "ncp", position: 2)
        case 2:
            self.playerHand += 1
            self.giveCard(player: "player", position: 3)
            self.giveCard(player: "ncp", position: 3)
        case 3:
            self.playerHand = 0
            self.giveCard(player: "player", position: 4)
            self.giveCard(player: "ncp", position: 4)
        default:
            self.playerHand = 0
        }
    }
    
    func giveCard(player: String, position: Int){
        if player == "player"{
            switch position {
            case 0:
                UIView.animate(withDuration: 1.0) {
                    self.playerCardSet[0].center.x = (self.playerPos[0].center.x)
                    self.playerCardSet[0].center.y = (self.playerPos[0].center.y)
                }
            case 1:
                UIView.animate(withDuration: 1.0) {
                    self.playerCardSet[1].center.x = (self.playerPos[1].center.x)
                    self.playerCardSet[1].center.y = (self.playerPos[1].center.y)
                    self.openCard(position: 1)
                }
            case 2:
                UIView.animate(withDuration: 1.0) {
                    self.playerCardSet[2].center.x = (self.playerPos[2].center.x)
                    self.playerCardSet[2].center.y = (self.playerPos[2].center.y)
                    self.openCard(position: 2)
                }
            case 3:
                UIView.animate(withDuration: 1.0) {
                    self.playerCardSet[3].center.x = (self.playerPos[3].center.x)
                    self.playerCardSet[3].center.y = (self.playerPos[3].center.y)
                    self.openCard(position: 3)
                }
            case 4:
                UIView.animate(withDuration: 1.0) {
                    self.playerCardSet[4].center.x = (self.playerPos[4].center.x)
                    self.playerCardSet[4].center.y = (self.playerPos[4].center.y)
                    self.openCard(position: 4)
                }
            default:
                print("Nothing")
            }
        }else{
            //NPC's Position
            switch position {
            case 0:
                UIView.animate(withDuration: 1.0) {
                    self.npcCardSet[0].center.x = self.npcPos[0].center.x
                    self.npcCardSet[0].center.y = self.npcPos[0].center.y
                }
            case 1:
                UIView.animate(withDuration: 1.0) {
                    self.npcCardSet[1].center.x = self.npcPos[1].center.x
                    self.npcCardSet[1].center.y = self.npcPos[1].center.y
                }
            case 2:
                UIView.animate(withDuration: 1.0) {
                    self.npcCardSet[2].center.x = self.npcPos[2].center.x
                    self.npcCardSet[2].center.y = self.npcPos[2].center.y
                }
            case 3:
                UIView.animate(withDuration: 1.0) {
                    self.npcCardSet[3].center.x = self.npcPos[3].center.x
                    self.npcCardSet[3].center.y = self.npcPos[3].center.y
                }
            case 4:
                UIView.animate(withDuration: 1.0) {
                    self.npcCardSet[4].center.x = self.npcPos[4].center.x
                    self.npcCardSet[4].center.y = self.npcPos[4].center.y
                }
            default:
                print("Nothing")
            }
        }
    }
    
    func openCard(position: Int){
        playerCardSet[position].setBackgroundImage(#imageLiteral(resourceName: "card-a02"), for: .normal)
        UIView.transition(with: playerCardSet[position], duration: 1, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        npcCardSet[position].setBackgroundImage(#imageLiteral(resourceName: "card-a04"), for: .normal)
        UIView.transition(with: npcCardSet[position], duration: 1, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
    func showDown(){
        npcCardSet[0].setBackgroundImage(#imageLiteral(resourceName: "card-a04"), for: .normal)
        UIView.transition(with: npcCardSet[0], duration: 1, options: .transitionFlipFromLeft, animations: nil, completion: nil)
    }
}

