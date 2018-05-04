//
//  ViewController.swift
//  BlackJack
//
//  Created by 世明 on 2018/5/4.
//  Copyright © 2018年 世明. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var playerPos: [UIImageView]!
    @IBOutlet var npcPos: [UIImageView]!
    @IBOutlet weak var cardStartPos: UIImageView!
    var playerHand = 0
    var cardView: UIView!
    
    @IBAction func btnGiveAct(_ sender: Any) {
        cardView = UIView(frame: CGRect(x: cardStartPos.frame.minX, y: cardStartPos.frame.minY, width: cardStartPos.bounds.maxX, height: cardStartPos.bounds.maxY))
        let testView: UIImageView = UIImageView(frame: CGRect(x: cardStartPos.frame.minX, y: cardStartPos.frame.minY, width: cardStartPos.bounds.maxX, height: cardStartPos.bounds.maxY))
        testView.image = #imageLiteral(resourceName: "card-e03")
        let test2View: UIImageView = UIImageView(frame: CGRect(x: cardStartPos.frame.minX, y: cardStartPos.frame.minY, width: cardStartPos.bounds.maxX, height: cardStartPos.bounds.maxY))
        test2View.image = #imageLiteral(resourceName: "card-a01")
        view.addSubview(testView)
        UIView.animate(withDuration: 1.0) {
            switch self.playerHand{
            case 0:
                testView.center.x = (self.playerPos.first?.center.x)!
                testView.center.y = (self.playerPos.first?.center.y)!
                self.playerHand += 1
            case 1:
                testView.center.x = (self.playerPos[1].center.x)
                testView.center.y = (self.playerPos[1].center.y)
                self.playerHand += 1
            case 2:
                testView.center.x = (self.playerPos[2].center.x)
                testView.center.y = (self.playerPos[2].center.y)
                self.playerHand += 1
            case 3:
                testView.center.x = (self.playerPos[3].center.x)
                testView.center.y = (self.playerPos[3].center.y)
                self.playerHand += 1
            case 4:
                testView.center.x = (self.playerPos[4].center.x)
                testView.center.y = (self.playerPos[4].center.y)
                self.playerHand = 0
            default:
                self.playerHand = 0
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

