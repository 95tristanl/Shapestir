//
//  GameOver.swift
//  Shapestir
//
//  Created by Tristan LeVeille on 7/19/15.
//  Copyright (c) 2015 Tristan Le Veille. All rights reserved.
//

import SpriteKit

class GameOver: SKScene
{
    var time = 200
    let gameOver:SKSpriteNode = SKSpriteNode(imageNamed:"gameover")
    
    
    
    override func didMoveToView(view: SKView)
    {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "doneWithAd:", name: "doneWithAdNotification", object: nil)
        self.backgroundColor = SKColor.blackColor()
        self.gameOver.position = CGPointMake(frame.width * 0.5, frame.height * 0.5)
        self.addChild(self.gameOver)
    }
    
    override func update(currentTime: CFTimeInterval)
    {
        time--
        
        if (time == 0) //once the clock runs down to 0, game over, goes to main screen
        {
            NSNotificationCenter.defaultCenter().postNotificationName("readyForAd", object: nil)
            let scene = GameScene(size: size)
            view!.ignoresSiblingOrder = true
            scene.scaleMode = .AspectFill
            view!.presentScene(scene)
        }
    }
    
    func doneWithAd(note: NSNotification)
    {
        let scene = GameScene(size: self.size)
        let skView = self.view as SKView!
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .AspectFill
        skView.presentScene(scene)
    }
}

