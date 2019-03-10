//
//  Instructions.swift
//  Shapestir
//
//  Created by Tristan LeVeille on 7/19/15.
//  Copyright (c) 2015 Tristan Le Veille. All rights reserved.
//

import SpriteKit

class Instructions: SKScene
{
    let menu:SKSpriteNode = SKSpriteNode(imageNamed:"menu")
    let helpText:SKSpriteNode = SKSpriteNode(imageNamed:"helpText")
    let example1:SKSpriteNode = SKSpriteNode(imageNamed:"example1")
    
    // var text1 = SKLabelNode(fontNamed: "DamascusBold")
    
    override func didMoveToView(view: SKView)
    {
        self.backgroundColor = SKColor.grayColor()
        self.menu.position = CGPointMake(frame.width * 0.85, frame.height * 0.25)
        //CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame))
        self.addChild(self.menu)
        
        self.helpText.position = CGPointMake(frame.width * 0.5, frame.height * 0.78)
        self.addChild(self.helpText)
        
        self.example1.position = CGPointMake(frame.width * 0.35, frame.height * 0.44)
        self.addChild(self.example1)
        
        // self.text1.text = "Touch the picture that correctly matches the text below it"
       
        /*
        self.text1.fontSize = 20
        self.text1.position = CGPointMake(frame.width * 0.5, frame.height * 0.8)
        self.addChild(self.text1)
        */
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        //.removeFromParent
        
        for touch: AnyObject in touches
        {
            let location = touch.locationInNode(self)
            if (self.nodeAtPoint(location) == self.menu) //goes to game scene
            {
                let scene = GameScene(size: self.size)
                let skView = self.view as SKView!
                skView.ignoresSiblingOrder = true
                //scene.size = skView.bounds.size
                scene.scaleMode = .AspectFill
                skView.presentScene(scene)
            }
        }
    }
    
    override func update(currentTime: CFTimeInterval)
    {
        
    }
}