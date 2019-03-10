//
//  GameScene.swift
//  Shapestir
//
//  Created by Tristan LeVeille on 7/19/15.
//  Copyright (c) 2015 Tristan Le Veille. All rights reserved.
//

import SpriteKit
import UIKit

class GameScene: SKScene {
    
    var games = 0
    var gamesLabel = SKLabelNode(fontNamed: "DamascusBold")
    let mainMenu:SKSpriteNode = SKSpriteNode(imageNamed:"main")
    let playButton:SKSpriteNode = SKSpriteNode(imageNamed:"play")
    let helpButton:SKSpriteNode = SKSpriteNode(imageNamed:"help")
    
    var gamesDefault = NSUserDefaults.standardUserDefaults() //saving
    
    var container: UIViewController!
    
    override func didMoveToView(view: SKView)
    {
        self.gamesLabel.fontSize = 30
        self.gamesLabel.fontColor = SKColor.whiteColor()
        self.gamesLabel.position = CGPointMake(frame.width * 0.16, frame.height * 0.16)
        self.addChild(self.gamesLabel) 
        
        self.backgroundColor = SKColor.grayColor()
        self.mainMenu.position = CGPointMake(frame.width * 0.50, frame.height * 0.50)
        self.playButton.position = CGPointMake(frame.width * 0.78, frame.height * 0.54)
        self.helpButton.position = CGPointMake(frame.width * 0.8, frame.height * 0.35)
        self.addChild(self.mainMenu)
        self.addChild(self.playButton)
        self.addChild(self.helpButton)
        
        // This block of code is for saving the number of games to the main screen
        if (gamesDefault.valueForKey("games") != nil) {
            games = gamesDefault.valueForKey("games") as! NSInteger!
            gamesLabel.text = String(format: "Games Played: %i", games)
        }
        else
        {
            gamesDefault.setObject(games, forKey: "games")
            gamesLabel.text = String(format: "Games Played: %i", games)
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch: AnyObject in touches
        {
            let location = touch.locationInNode(self)
            if (self.nodeAtPoint(location) == self.playButton) //goes to game scene
            {
                games++
                //saves games played number
                gamesDefault.setValue(games, forKey: "games")
                gamesDefault.synchronize()
                
                let scene = Game(size: self.size)
                let skView = self.view as SKView!
                skView.ignoresSiblingOrder = true
                //scene.size = skView.bounds.size
                scene.scaleMode = .AspectFill
                skView.presentScene(scene)
            }
            else if (self.nodeAtPoint(location) == self.helpButton) //goes to help scene
            {
                let scene = Instructions(size: self.size)
                let skView = self.view as SKView!
                skView.ignoresSiblingOrder = true
                //scene.size = skView.bounds.size
                scene.scaleMode = .AspectFill
                skView.presentScene(scene)
            }
        }
    }
}
