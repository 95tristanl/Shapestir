
//  Game.swift
//  Shapestir
//
//  Created by Tristan LeVeille on 7/19/15.
//  Copyright (c) 2015 Tristan Le Veille. All rights reserved.

import SpriteKit
import UIKit

class Game: SKScene
{
    var games = 0
    var startTime = 220 //220
    var time = 220       //220
    var endGame = false
    var moveOn = false
    var onHold = false
    var score = 0
    var highScore = 0
    var scoreText = SKLabelNode(fontNamed: "DamascusBold")
    var highScoreText = SKLabelNode(fontNamed: "DamascusBold")
    
    var correctPic: SKSpriteNode = SKSpriteNode(imageNamed: "")
    var pic2: SKSpriteNode = SKSpriteNode(imageNamed: "")
    var pic3: SKSpriteNode = SKSpriteNode(imageNamed: "")
    var pic4: SKSpriteNode = SKSpriteNode(imageNamed: "")
    
    var colorText1 = SKLabelNode(fontNamed: "DamascusBold")
    var colorText2 = SKLabelNode(fontNamed: "DamascusBold")
    var colorText3 = SKLabelNode(fontNamed: "DamascusBold")
    var colorText4 = SKLabelNode(fontNamed: "DamascusBold")
    
    var pause: SKSpriteNode = SKSpriteNode(imageNamed: "pause") //pause button
    var pauseText = SKLabelNode(fontNamed: "DamascusBold")
    let play:SKSpriteNode = SKSpriteNode(imageNamed:"play")
    
    var correctPoint = 0.2
    var point2 = 0.4
    var point3 = 0.6
    var point4 = 0.8
    
    
    override func didMoveToView(view: SKView)
    {
        games++
        
        self.backgroundColor = SKColor.grayColor()
        //displays score
        self.scoreText.text = "Score: 0"
        self.scoreText.fontSize = 30
        self.scoreText.position = CGPointMake(frame.width * 0.83, frame.height * 0.8)
        self.scoreText.fontColor = SKColor.whiteColor()
        self.addChild(self.scoreText)
        
        self.highScoreText.text = "High Score: 0"
        self.highScoreText.fontSize = 30
        self.highScoreText.position = CGPointMake(frame.width * 0.17, frame.height * 0.8)
        self.scoreText.fontColor = SKColor.whiteColor()
        self.addChild(self.highScoreText)
        
        self.pause.position = CGPointMake(frame.width * 0.5, frame.height * 0.8)
        self.addChild(self.pause)
        
        //array of shape pics
        var shapeArray = ["circle", "diamond", "oval", "pentagon", "rectangle", "square", "star", "triangle"]
        
        //array of color pics
        var colorArray = ["black", "blue", "brown", "green", "orange", "pink", "purple", "red", "white", "yellow"]
        
        //array of food pics
        var foodArray = ["apple", "banana", "candy", "carrot", "cheese", "cherry", "chocolate", "donut", "grapes", "lime", "meat", "pizza"]
        
        //array of pic pics
        var picArray = ["balloon", "bird", "boat", "book", "brush", "chair", "cloud", "comb", "envelope", "fish", "football", "lamp", "mirror", "moon", "mountain", "pencil", "phone", "puck", "rocket", "shirt", "snake", "sun", "tree", "wheel"]
        
        //array of everything pics
        var evArray = ["apple", "balloon", "banana", "bird", "black", "blue", "boat", "book", "brown", "brush", "candy", "carrot", "chair", "cheese", "cherry", "chocolate", "circle", "cloud", "comb", "diamond", "donut", "envelope", "fish", "football", "grapes", "green", "lamp", "lime", "meat", "mirror", "moon", "mountain", "orange", "oval", "pencil", "pentagon", "phone", "pink", "pizza", "puck", "purple", "rectangle", "red", "rocket", "shirt", "snake", "square", "star", "sun", "tree", "triangle", "wheel", "white", "yellow"]
        
        //4 random numbers that will choose 4 random different color pics
        var randNum1 = 0
        var randNum2 = 0
        var randNum3 = 0
        var randNum4 = 0
        
        if (score < 21) //need to change back to the shapeArray
        {
            //shapes
            randNum1 = Int(arc4random_uniform(UInt32(shapeArray.count)))
            randNum2 = Int(arc4random_uniform(UInt32(shapeArray.count)))
            randNum3 = Int(arc4random_uniform(UInt32(shapeArray.count)))
            randNum4 = Int(arc4random_uniform(UInt32(shapeArray.count)))
            
            //these while loops make sure I dont pick the same random number => I dont have two of the same images
            while(randNum2 == randNum1) {
                randNum2 = Int(arc4random_uniform(UInt32(shapeArray.count)))
            }
            while(randNum3 == randNum1 || randNum3 == randNum2) {
                randNum3 = Int(arc4random_uniform(UInt32(shapeArray.count)))
            }
            
            while(randNum4 == randNum1 || randNum4 == randNum2 || randNum4 == randNum3) {
                randNum4 = Int(arc4random_uniform(UInt32(shapeArray.count)))
            }
        }
        else if (score >= 21 && score < 51)
        {
            //colors
            randNum1 = Int(arc4random_uniform(UInt32(colorArray.count)))
            randNum2 = Int(arc4random_uniform(UInt32(colorArray.count)))
            randNum3 = Int(arc4random_uniform(UInt32(colorArray.count)))
            randNum4 = Int(arc4random_uniform(UInt32(colorArray.count)))
            
            while(randNum2 == randNum1) {
                randNum2 = Int(arc4random_uniform(UInt32(colorArray.count)))
            }
            while(randNum3 == randNum1 || randNum3 == randNum2) {
                randNum3 = Int(arc4random_uniform(UInt32(colorArray.count)))
            }
            
            while(randNum4 == randNum1 || randNum4 == randNum2 || randNum4 == randNum3) {
                randNum4 = Int(arc4random_uniform(UInt32(colorArray.count)))
            }
        }
        else if (score >= 51 && score < 91)
        {
            //food
            randNum1 = Int(arc4random_uniform(UInt32(foodArray.count)))
            randNum2 = Int(arc4random_uniform(UInt32(foodArray.count)))
            randNum3 = Int(arc4random_uniform(UInt32(foodArray.count)))
            randNum4 = Int(arc4random_uniform(UInt32(foodArray.count)))
            
            while(randNum2 == randNum1) {
                randNum2 = Int(arc4random_uniform(UInt32(foodArray.count)))
            }
            while(randNum3 == randNum1 || randNum3 == randNum2) {
                randNum3 = Int(arc4random_uniform(UInt32(foodArray.count)))
            }
            
            while(randNum4 == randNum1 || randNum4 == randNum2 || randNum4 == randNum3) {
                randNum4 = Int(arc4random_uniform(UInt32(foodArray.count)))
            }
        }
        else if (score >= 91 && score < 151)
        {
            //pics
            randNum1 = Int(arc4random_uniform(UInt32(picArray.count)))
            randNum2 = Int(arc4random_uniform(UInt32(picArray.count)))
            randNum3 = Int(arc4random_uniform(UInt32(picArray.count)))
            randNum4 = Int(arc4random_uniform(UInt32(picArray.count)))
            
            while(randNum2 == randNum1) {
                randNum2 = Int(arc4random_uniform(UInt32(picArray.count)))
            }
            while(randNum3 == randNum1 || randNum3 == randNum2) {
                randNum3 = Int(arc4random_uniform(UInt32(picArray.count)))
            }
            
            while(randNum4 == randNum1 || randNum4 == randNum2 || randNum4 == randNum3) {
                randNum4 = Int(arc4random_uniform(UInt32(picArray.count)))
            }
        }
        else if (score >= 151)
        {
            //everything
            randNum1 = Int(arc4random_uniform(UInt32(evArray.count)))
            randNum2 = Int(arc4random_uniform(UInt32(evArray.count)))
            randNum3 = Int(arc4random_uniform(UInt32(evArray.count)))
            randNum4 = Int(arc4random_uniform(UInt32(evArray.count)))
            
            while(randNum2 == randNum1) {
                randNum2 = Int(arc4random_uniform(UInt32(evArray.count)))
            }
            while(randNum3 == randNum1 || randNum3 == randNum2) {
                randNum3 = Int(arc4random_uniform(UInt32(evArray.count)))
            }
            
            while(randNum4 == randNum1 || randNum4 == randNum2 || randNum4 == randNum3) {
                randNum4 = Int(arc4random_uniform(UInt32(evArray.count)))
            }
        }
        
        //decides where each colorPic will go
        var points = [0.16, 0.38, 0.62, 0.84]
        let rand1 = Int(arc4random_uniform(UInt32(4)))
        correctPoint = points[rand1]
        points.removeAtIndex(rand1)
        let rand2 = Int(arc4random_uniform(UInt32(3)))
        point2 = points[rand2]
        points.removeAtIndex(rand2)
        let rand3 = Int(arc4random_uniform(UInt32(2)))
        point3 = points[rand3]
        points.removeAtIndex(rand3)
        point4 = points[0]
        
        //the chosen color pics, the random number choses an image in the array, then set that image to the location
        if (score < 21)
        {
            //picks from the shape array
            correctPic = SKSpriteNode(imageNamed: shapeArray[randNum1])
            pic2 = SKSpriteNode(imageNamed: shapeArray[randNum2])
            pic3 = SKSpriteNode(imageNamed: shapeArray[randNum3])
            pic4 = SKSpriteNode(imageNamed: shapeArray[randNum4])
        }
        else if (score >= 21 && score < 51)
        {
            //picks from the color array
            correctPic = SKSpriteNode(imageNamed: colorArray[randNum1])
            pic2 = SKSpriteNode(imageNamed: colorArray[randNum2])
            pic3 = SKSpriteNode(imageNamed: colorArray[randNum3])
            pic4 = SKSpriteNode(imageNamed: colorArray[randNum4])
        }
        else if (score >= 51 && score < 91)
        {
            //picks from the food array
            correctPic = SKSpriteNode(imageNamed: foodArray[randNum1])
            pic2 = SKSpriteNode(imageNamed: foodArray[randNum2])
            pic3 = SKSpriteNode(imageNamed: foodArray[randNum3])
            pic4 = SKSpriteNode(imageNamed: foodArray[randNum4])
        }
        else if (score >= 91 && score < 151)
        {
            //picks from the pic array
            correctPic = SKSpriteNode(imageNamed: picArray[randNum1])
            pic2 = SKSpriteNode(imageNamed: picArray[randNum2])
            pic3 = SKSpriteNode(imageNamed: picArray[randNum3])
            pic4 = SKSpriteNode(imageNamed: picArray[randNum4])
        }
        else if (score >= 151)
        {
            //picks from the everything array
            correctPic = SKSpriteNode(imageNamed: evArray[randNum1])
            pic2 = SKSpriteNode(imageNamed: evArray[randNum2])
            pic3 = SKSpriteNode(imageNamed: evArray[randNum3])
            pic4 = SKSpriteNode(imageNamed: evArray[randNum4])
        }
        
        //chooses 4 random color texts to go under each pic
        var num1 = 0
        var num2 = 0
        var num3 = 0
        var num4 = 0
        
        //re-choose 4 new random numbers
        if (score < 21) 
        {
            //shapes
            num1 = Int(arc4random_uniform(UInt32(shapeArray.count)))
            num2 = Int(arc4random_uniform(UInt32(shapeArray.count)))
            num3 = Int(arc4random_uniform(UInt32(shapeArray.count)))
            num4 = Int(arc4random_uniform(UInt32(shapeArray.count)))
            
            while(num2 == randNum2) {
                num2 = Int(arc4random_uniform(UInt32(shapeArray.count)))
            }
            
            while(num3 == randNum3) {
                num3 = Int(arc4random_uniform(UInt32(shapeArray.count)))
            }
            
            while(num4 == randNum4) {
                num4 = Int(arc4random_uniform(UInt32(shapeArray.count)))
            }
        }
        else if (score >= 21 && score < 51)
        {
            //colors
            num1 = Int(arc4random_uniform(UInt32(colorArray.count)))
            num2 = Int(arc4random_uniform(UInt32(colorArray.count)))
            num3 = Int(arc4random_uniform(UInt32(colorArray.count)))
            num4 = Int(arc4random_uniform(UInt32(colorArray.count)))
            
            while(num2 == randNum2) {
                num2 = Int(arc4random_uniform(UInt32(colorArray.count)))
            }
            
            while(num3 == randNum3) {
                num3 = Int(arc4random_uniform(UInt32(colorArray.count)))
            }
            
            while(num4 == randNum4) {
                num4 = Int(arc4random_uniform(UInt32(colorArray.count)))
            }
        }
        else if (score >= 51 && score < 91)
        {
            //food
            num1 = Int(arc4random_uniform(UInt32(foodArray.count)))
            num2 = Int(arc4random_uniform(UInt32(foodArray.count)))
            num3 = Int(arc4random_uniform(UInt32(foodArray.count)))
            num4 = Int(arc4random_uniform(UInt32(foodArray.count)))
            
            while(num2 == randNum2) {
                num2 = Int(arc4random_uniform(UInt32(foodArray.count)))
            }
            
            while(num3 == randNum3) {
                num3 = Int(arc4random_uniform(UInt32(foodArray.count)))
            }
            
            while(num4 == randNum4) {
                num4 = Int(arc4random_uniform(UInt32(foodArray.count)))
            }
        }
        else if (score >= 91 && score < 151)
        {
            //pics
            num1 = Int(arc4random_uniform(UInt32(picArray.count)))
            num2 = Int(arc4random_uniform(UInt32(picArray.count)))
            num3 = Int(arc4random_uniform(UInt32(picArray.count)))
            num4 = Int(arc4random_uniform(UInt32(picArray.count)))
            
            while(num2 == randNum2) {
                num2 = Int(arc4random_uniform(UInt32(picArray.count)))
            }
            
            while(num3 == randNum3) {
                num3 = Int(arc4random_uniform(UInt32(picArray.count)))
            }
            
            while(num4 == randNum4) {
                num4 = Int(arc4random_uniform(UInt32(picArray.count)))
            }
        }
        else if (score >= 151)
        {
            //everything
            num1 = Int(arc4random_uniform(UInt32(evArray.count)))
            num2 = Int(arc4random_uniform(UInt32(evArray.count)))
            num3 = Int(arc4random_uniform(UInt32(evArray.count)))
            num4 = Int(arc4random_uniform(UInt32(evArray.count)))
            
            while(num2 == randNum2) {
                num2 = Int(arc4random_uniform(UInt32(evArray.count)))
            }
            
            while(num3 == randNum3) {
                num3 = Int(arc4random_uniform(UInt32(evArray.count)))
            }
            
            while(num4 == randNum4) {
                num4 = Int(arc4random_uniform(UInt32(evArray.count)))
            }
        }
        
        //creates frame width pixel positions
        let frameWidth = Double(frame.width)
        let cp = CGFloat(frameWidth * correctPoint)
        let p2 = CGFloat(frameWidth * point2)
        let p3 = CGFloat(frameWidth * point3)
        let p4 = CGFloat(frameWidth * point4)
        
        //sets pic into their positions using the frame width from above
        correctPic.position = CGPointMake(cp, frame.height * 0.5)
        pic2.position = CGPointMake(p2, frame.height * 0.5)
        pic3.position = CGPointMake(p3, frame.height * 0.5)
        pic4.position = CGPointMake(p4, frame.height * 0.5)
        
        //adds all the pics into the view
        addChild(correctPic)
        addChild(pic2)
        addChild(pic3)
        addChild(pic4)
        
        //text under the pics, sets the text position, what the text says (grab from the array), and the font size
        if (score < 21)
        {
            //shapes
            colorText1.text = shapeArray[randNum1]
            colorText1.fontSize = 30
            colorText1.position = CGPointMake(cp, frame.height * 0.35)
            colorText2.text = shapeArray[num2]
            colorText2.fontSize = 30
            colorText2.position = CGPointMake(p2, frame.height * 0.35)
            colorText3.text = shapeArray[num3]
            colorText3.fontSize = 30
            colorText3.position = CGPointMake(p3, frame.height * 0.35)
            colorText4.text = shapeArray[num4]
            colorText4.fontSize = 30
            colorText4.position = CGPointMake(p4, frame.height * 0.35)
        }
        else if (score >= 21 && score < 51)
        {
            //colors
            colorText1.text = colorArray[randNum1]
            colorText1.fontSize = 30
            colorText1.position = CGPointMake(cp, frame.height * 0.35)
            colorText2.text = colorArray[num2]
            colorText2.fontSize = 30
            colorText2.position = CGPointMake(p2, frame.height * 0.35)
            colorText3.text = colorArray[num3]
            colorText3.fontSize = 30
            colorText3.position = CGPointMake(p3, frame.height * 0.35)
            colorText4.text = colorArray[num4]
            colorText4.fontSize = 30
            colorText4.position = CGPointMake(p4, frame.height * 0.35)
        }
        else if (score >= 51 && score < 91)
        {
            //food
            colorText1.text = foodArray[randNum1]
            colorText1.fontSize = 30
            colorText1.position = CGPointMake(cp, frame.height * 0.35)
            colorText2.text = foodArray[num2]
            colorText2.fontSize = 30
            colorText2.position = CGPointMake(p2, frame.height * 0.35)
            colorText3.text = foodArray[num3]
            colorText3.fontSize = 30
            colorText3.position = CGPointMake(p3, frame.height * 0.35)
            colorText4.text = foodArray[num4]
            colorText4.fontSize = 30
            colorText4.position = CGPointMake(p4, frame.height * 0.35)
        }
        else if (score >= 91 && score < 151)
        {
            //pics
            colorText1.text = picArray[randNum1]
            colorText1.fontSize = 30
            colorText1.position = CGPointMake(cp, frame.height * 0.35)
            colorText2.text = picArray[num2]
            colorText2.fontSize = 30
            colorText2.position = CGPointMake(p2, frame.height * 0.35)
            colorText3.text = picArray[num3]
            colorText3.fontSize = 30
            colorText3.position = CGPointMake(p3, frame.height * 0.35)
            colorText4.text = picArray[num4]
            colorText4.fontSize = 30
            colorText4.position = CGPointMake(p4, frame.height * 0.35)
        }
        else if (score >= 151)
        {
            //everything
            colorText1.text = evArray[randNum1]
            colorText1.fontSize = 30
            colorText1.position = CGPointMake(cp, frame.height * 0.35)
            colorText2.text = evArray[num2]
            colorText2.fontSize = 30
            colorText2.position = CGPointMake(p2, frame.height * 0.35)
            colorText3.text = evArray[num3]
            colorText3.fontSize = 30
            colorText3.position = CGPointMake(p3, frame.height * 0.35)
            colorText4.text = evArray[num4]
            colorText4.fontSize = 30
            colorText4.position = CGPointMake(p4, frame.height * 0.35)
        }
        
        //creates 4 random numbers which is used to set the colors of the text under the pics
        let col1 = Int(arc4random_uniform(UInt32(10)))
        let col2 = Int(arc4random_uniform(UInt32(10)))
        let col3 = Int(arc4random_uniform(UInt32(10)))
        let col4 = Int(arc4random_uniform(UInt32(10)))
        
        //setting random colors to the texts
        if (col1 == 0)
        {
            colorText1.fontColor = SKColor.blackColor()
        } else if (col1 == 1) {
            colorText1.fontColor = SKColor.blueColor()
        } else if (col1 == 2) {
            colorText1.fontColor = SKColor.brownColor()
        } else if (col1 == 3) {
            colorText1.fontColor = SKColor.greenColor()
        } else if (col1 == 4) {
            colorText1.fontColor = SKColor.orangeColor()
        } else if (col1 == 5) {
            colorText1.fontColor = SKColor.magentaColor()
        } else if (col1 == 6) {
            colorText1.fontColor = SKColor.purpleColor()
        } else if (col1 == 7) {
            colorText1.fontColor = SKColor.redColor()
        } else if (col1 == 8) {
            colorText1.fontColor = SKColor.yellowColor()
        } else if (col1 == 9) {
            colorText1.fontColor = SKColor.whiteColor()
        }
        
        if (col2 == 0)
        {
            colorText2.fontColor = SKColor.blackColor()
        } else if (col2 == 1) {
            colorText2.fontColor = SKColor.blueColor()
        } else if (col2 == 2) {
            colorText2.fontColor = SKColor.brownColor()
        } else if (col2 == 3) {
            colorText2.fontColor = SKColor.greenColor()
        } else if (col2 == 4) {
            colorText2.fontColor = SKColor.orangeColor()
        } else if (col2 == 5) {
            colorText2.fontColor = SKColor.magentaColor()
        } else if (col2 == 6) {
            colorText2.fontColor = SKColor.purpleColor()
        } else if (col2 == 7) {
            colorText2.fontColor = SKColor.redColor()
        } else if (col2 == 8) {
            colorText2.fontColor = SKColor.yellowColor()
        } else if (col1 == 9) {
            colorText2.fontColor = SKColor.whiteColor()
        }
        
        if (col3 == 0)
        {
            colorText3.fontColor = SKColor.blackColor()
        } else if (col3 == 1) {
            colorText3.fontColor = SKColor.blueColor()
        } else if (col3 == 2) {
            colorText3.fontColor = SKColor.brownColor()
        } else if (col3 == 3) {
            colorText3.fontColor = SKColor.greenColor()
        } else if (col3 == 4) {
            colorText3.fontColor = SKColor.orangeColor()
        } else if (col3 == 5) {
            colorText3.fontColor = SKColor.magentaColor()
        } else if (col3 == 6) {
            colorText3.fontColor = SKColor.purpleColor()
        } else if (col3 == 7) {
            colorText3.fontColor = SKColor.redColor()
        } else if (col3 == 8) {
            colorText3.fontColor = SKColor.yellowColor()
        } else if (col1 == 9) {
            colorText3.fontColor = SKColor.whiteColor()
        }
        
        if (col4 == 0)
        {
            colorText4.fontColor = SKColor.blackColor()
        } else if (col4 == 1) {
            colorText4.fontColor = SKColor.blueColor()
        } else if (col4 == 2) {
            colorText4.fontColor = SKColor.brownColor()
        } else if (col4 == 3) {
            colorText4.fontColor = SKColor.greenColor()
        } else if (col4 == 4) {
            colorText4.fontColor = SKColor.orangeColor()
        } else if (col4 == 5) {
            colorText4.fontColor = SKColor.magentaColor()
        } else if (col4 == 6) {
            colorText4.fontColor = SKColor.purpleColor()
        } else if (col4 == 7) {
            colorText4.fontColor = SKColor.redColor()
        } else if (col4 == 8) {
            colorText4.fontColor = SKColor.yellowColor()
        } else if (col1 == 9) {
            colorText4.fontColor = SKColor.whiteColor()
        }
        
        addChild(colorText1)
        addChild(colorText2)
        addChild(colorText3)
        addChild(colorText4)
        
        //saves the high score
        let HighScoreDefault = NSUserDefaults.standardUserDefaults()
        if (HighScoreDefault.valueForKey("highScore") != nil) {
            highScore = HighScoreDefault.valueForKey("highScore") as! NSInteger!
            highScoreText.text = String(format: "High Score: %i", highScore)
        }
        
        //saves number of games
        let gamesDefault = NSUserDefaults.standardUserDefaults()
        if (gamesDefault.valueForKey("games") != nil) {
            games = HighScoreDefault.valueForKey("games") as! NSInteger!
            // highScoreText.text = String(format: "High Score: %i", highScore)
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?)
    {
        for touch: AnyObject in touches
        {
            let location = touch.locationInNode(self)
            
            //if I touch the correct pic, increment the score, update the score label, see if the game needs to speed up, and set bool moveOn to true so that we can delete all the sprites, and bring in 4 new ones = next level
            if (self.nodeAtPoint(location) == correctPic)
            {
                score++
                self.scoreText.text = String(format: "Score: %i", score)
                
                if (startTime > 90 && score % 10 == 0) //if time gets to a point no longer decrease the time            because it will get too fast
                {
                    startTime = startTime - 3;
                    
                }
                moveOn = true
            }
                //if I touch any of the incorrect pics, end the game, save the score if its higher than the high score
            else if (self.nodeAtPoint(location) == pic2 || self.nodeAtPoint(location) == pic3 || self.nodeAtPoint(location) == pic4)
            {
                endGame = true
                
                //save high score
                if (score > highScore)
                {
                    highScore = score
                    highScoreText.text = String(format: "High Score: %i", highScore)
                    
                    let HighScoreDefault = NSUserDefaults.standardUserDefaults()
                    HighScoreDefault.setValue(highScore, forKey: "highScore")
                    //HighScoreDefault.synchronize()
                }
            }
            else if (self.nodeAtPoint(location) == pause) //for the pause option
            {
                onHold = true //stops count-down
                
                //remove everything so no cheating
                correctPic.removeFromParent()
                pic2.removeFromParent()
                pic3.removeFromParent()
                pic4.removeFromParent()
                colorText1.removeFromParent()
                colorText2.removeFromParent()
                colorText3.removeFromParent()
                colorText4.removeFromParent()
                pause.removeFromParent()
                
                //create a pause pause text to show the game has paused
                self.pauseText.text = "The Game is Paused"
                self.pauseText.fontSize = 50
                self.pauseText.fontColor = SKColor.whiteColor()
                self.pauseText.position = CGPointMake(frame.width * 0.5, frame.height * 0.68)
                self.addChild(self.pauseText)
                
                //put in the play botton that will bring back all the pics, start the timer from where it left off, as well as the game
                self.play.position = CGPointMake(frame.width * 0.5, frame.height * 0.4)
                self.addChild(self.play)
            }
                //for when the game is in the pause mode, and you click the play botton
            else if (self.nodeAtPoint(location) == play)
            {
                //remove pause text
                pauseText.removeFromParent()
                play.removeFromParent()
                
                //add everything back
                addChild(pause)
                addChild(correctPic)
                addChild(pic2)
                addChild(pic3)
                addChild(pic4)
                addChild(colorText1)
                addChild(colorText2)
                addChild(colorText3)
                addChild(colorText4)
                
                onHold = false //starts count-down again
            }
            
        }
    }
    
    override func update(currentTime: CFTimeInterval)
    {
        if (onHold == false) //when the game is running in a level
        {
            time--
        }
        
        if (time <= 0) //when time runs out, end the game
        {
            endGame = true
            
            //Save high score
            if (score > highScore)
            {
                highScore = score
                highScoreText.text = String(format: "High Score: %i", highScore)
                
                let HighScoreDefault = NSUserDefaults.standardUserDefaults()
                HighScoreDefault.setValue(highScore, forKey: "highScore")
                //HighScoreDefault.synchronize()
            }
        }
        
        if (endGame == true) //once the clock runs down to 0, game over, goes to main screen
        {
            let scene = GameOver(size: self.size)
            let skView = self.view as SKView!
            skView.ignoresSiblingOrder = true
            scene.scaleMode = .AspectFill
            //scene.size = skView.bounds.size
            skView.presentScene(scene)
        }
        else if (moveOn == true) //if you touch the correct pic, restart the timer, load new pics
        {
            time = startTime
            
            correctPic.removeFromParent()
            pic2.removeFromParent()
            pic3.removeFromParent()
            pic4.removeFromParent()
            colorText1.removeFromParent()
            colorText2.removeFromParent()
            colorText3.removeFromParent()
            colorText4.removeFromParent()
            
            //array of shape pics
            var shapeArray = ["circle", "diamond", "oval", "pentagon", "rectangle", "square", "star", "triangle"]
            
            //array of color pics
            var colorArray = ["black", "blue", "brown", "green", "orange", "pink", "purple", "red", "white", "yellow"]
            
            //array of food pics
            var foodArray = ["apple", "banana", "candy", "carrot", "cheese", "cherry", "chocolate", "donut", "grapes", "lime", "meat", "pizza"]
            
            //array of pic pics
            var picArray = ["balloon", "bird", "boat", "book", "brush", "chair", "cloud", "comb", "envelope", "fish", "football", "lamp", "mirror", "moon", "mountain", "pencil", "phone", "puck", "rocket", "shirt", "snake", "sun", "tree", "wheel"]
            
            //array of everything pics
            var evArray = ["apple", "balloon", "banana", "bird", "black", "blue", "boat", "book", "brown", "brush", "candy", "carrot", "chair", "cheese", "cherry", "chocolate", "circle", "cloud", "comb", "diamond", "donut", "envelope", "fish", "football", "grapes", "green", "lamp", "lime", "meat", "mirror", "moon", "mountain", "orange", "oval", "pencil", "pentagon", "phone", "pink", "pizza", "puck", "purple", "rectangle", "red", "rocket", "shirt", "snake", "square", "star", "sun", "tree", "triangle", "wheel", "white", "yellow"]
            
            //4 random numbers that will choose 4 random different pics
            var randNum1 = 0
            var randNum2 = 0
            var randNum3 = 0
            var randNum4 = 0
            
            if (score < 21)
            {
                //shapes
                randNum1 = Int(arc4random_uniform(UInt32(shapeArray.count)))
                randNum2 = Int(arc4random_uniform(UInt32(shapeArray.count)))
                randNum3 = Int(arc4random_uniform(UInt32(shapeArray.count)))
                randNum4 = Int(arc4random_uniform(UInt32(shapeArray.count)))
                
                while(randNum2 == randNum1) {
                    randNum2 = Int(arc4random_uniform(UInt32(shapeArray.count)))
                }
                while(randNum3 == randNum1 || randNum3 == randNum2) {
                    randNum3 = Int(arc4random_uniform(UInt32(shapeArray.count)))
                }
                
                while(randNum4 == randNum1 || randNum4 == randNum2 || randNum4 == randNum3) {
                    randNum4 = Int(arc4random_uniform(UInt32(shapeArray.count)))
                }
            }
            else if (score >= 21 && score < 51)
            {
                //colors
                randNum1 = Int(arc4random_uniform(UInt32(colorArray.count)))
                randNum2 = Int(arc4random_uniform(UInt32(colorArray.count)))
                randNum3 = Int(arc4random_uniform(UInt32(colorArray.count)))
                randNum4 = Int(arc4random_uniform(UInt32(colorArray.count)))
                
                while(randNum2 == randNum1) {
                    randNum2 = Int(arc4random_uniform(UInt32(colorArray.count)))
                }
                while(randNum3 == randNum1 || randNum3 == randNum2) {
                    randNum3 = Int(arc4random_uniform(UInt32(colorArray.count)))
                }
                
                while(randNum4 == randNum1 || randNum4 == randNum2 || randNum4 == randNum3) {
                    randNum4 = Int(arc4random_uniform(UInt32(colorArray.count)))
                }
            }
            else if (score >= 51 && score < 91)
            {
                //food
                randNum1 = Int(arc4random_uniform(UInt32(foodArray.count)))
                randNum2 = Int(arc4random_uniform(UInt32(foodArray.count)))
                randNum3 = Int(arc4random_uniform(UInt32(foodArray.count)))
                randNum4 = Int(arc4random_uniform(UInt32(foodArray.count)))
                
                while(randNum2 == randNum1) {
                    randNum2 = Int(arc4random_uniform(UInt32(foodArray.count)))
                }
                while(randNum3 == randNum1 || randNum3 == randNum2) {
                    randNum3 = Int(arc4random_uniform(UInt32(foodArray.count)))
                }
                
                while(randNum4 == randNum1 || randNum4 == randNum2 || randNum4 == randNum3) {
                    randNum4 = Int(arc4random_uniform(UInt32(foodArray.count)))
                }
            }
            else if (score >= 91 && score < 151)
            {
                //pics
                randNum1 = Int(arc4random_uniform(UInt32(picArray.count)))
                randNum2 = Int(arc4random_uniform(UInt32(picArray.count)))
                randNum3 = Int(arc4random_uniform(UInt32(picArray.count)))
                randNum4 = Int(arc4random_uniform(UInt32(picArray.count)))
                
                while(randNum2 == randNum1) {
                    randNum2 = Int(arc4random_uniform(UInt32(picArray.count)))
                }
                while(randNum3 == randNum1 || randNum3 == randNum2) {
                    randNum3 = Int(arc4random_uniform(UInt32(picArray.count)))
                }
                
                while(randNum4 == randNum1 || randNum4 == randNum2 || randNum4 == randNum3) {
                    randNum4 = Int(arc4random_uniform(UInt32(picArray.count)))
                }
            }
            else if (score >= 151)
            {
                //everything
                randNum1 = Int(arc4random_uniform(UInt32(evArray.count)))
                randNum2 = Int(arc4random_uniform(UInt32(evArray.count)))
                randNum3 = Int(arc4random_uniform(UInt32(evArray.count)))
                randNum4 = Int(arc4random_uniform(UInt32(evArray.count)))
                
                while(randNum2 == randNum1) {
                    randNum2 = Int(arc4random_uniform(UInt32(evArray.count)))
                }
                while(randNum3 == randNum1 || randNum3 == randNum2) {
                    randNum3 = Int(arc4random_uniform(UInt32(evArray.count)))
                }
                
                while(randNum4 == randNum1 || randNum4 == randNum2 || randNum4 == randNum3) {
                    randNum4 = Int(arc4random_uniform(UInt32(evArray.count)))
                }
            }
            
            //decides where each colorPic will go
            var points = [0.16, 0.38, 0.62, 0.84]
            let rand1 = Int(arc4random_uniform(UInt32(4)))
            correctPoint = points[rand1]
            points.removeAtIndex(rand1)
            let rand2 = Int(arc4random_uniform(UInt32(3)))
            point2 = points[rand2]
            points.removeAtIndex(rand2)
            let rand3 = Int(arc4random_uniform(UInt32(2)))
            point3 = points[rand3]
            points.removeAtIndex(rand3)
            point4 = points[0]
            
            //the chosen color pics
            if (score < 21)
            {
                //shape
                correctPic = SKSpriteNode(imageNamed: shapeArray[randNum1])
                pic2 = SKSpriteNode(imageNamed: shapeArray[randNum2])
                pic3 = SKSpriteNode(imageNamed: shapeArray[randNum3])
                pic4 = SKSpriteNode(imageNamed: shapeArray[randNum4])
            }
            else if (score >= 21 && score < 51)
            {
                //color
                correctPic = SKSpriteNode(imageNamed: colorArray[randNum1])
                pic2 = SKSpriteNode(imageNamed: colorArray[randNum2])
                pic3 = SKSpriteNode(imageNamed: colorArray[randNum3])
                pic4 = SKSpriteNode(imageNamed: colorArray[randNum4])
            }
            else if (score >= 51 && score < 91)
            {
                //food
                correctPic = SKSpriteNode(imageNamed: foodArray[randNum1])
                pic2 = SKSpriteNode(imageNamed: foodArray[randNum2])
                pic3 = SKSpriteNode(imageNamed: foodArray[randNum3])
                pic4 = SKSpriteNode(imageNamed: foodArray[randNum4])
            }
            else if (score >= 91 && score < 151)
            {
                //food
                correctPic = SKSpriteNode(imageNamed: picArray[randNum1])
                pic2 = SKSpriteNode(imageNamed: picArray[randNum2])
                pic3 = SKSpriteNode(imageNamed: picArray[randNum3])
                pic4 = SKSpriteNode(imageNamed: picArray[randNum4])
            }
            else if (score >= 151)
            {
                //everything
                correctPic = SKSpriteNode(imageNamed: evArray[randNum1])
                pic2 = SKSpriteNode(imageNamed: evArray[randNum2])
                pic3 = SKSpriteNode(imageNamed: evArray[randNum3])
                pic4 = SKSpriteNode(imageNamed: evArray[randNum4])
            }
            
            //chooses 4 random color texts to go under each pic
            var num1 = 0
            var num2 = 0
            var num3 = 0
            var num4 = 0
            
            if (score < 21)
            {
                //shapes
                num1 = Int(arc4random_uniform(UInt32(shapeArray.count)))
                num2 = Int(arc4random_uniform(UInt32(shapeArray.count)))
                num3 = Int(arc4random_uniform(UInt32(shapeArray.count)))
                num4 = Int(arc4random_uniform(UInt32(shapeArray.count)))
                
                while(num2 == randNum2) {
                    num2 = Int(arc4random_uniform(UInt32(shapeArray.count)))
                }
                
                while(num3 == randNum3) {
                    num3 = Int(arc4random_uniform(UInt32(shapeArray.count)))
                }
                
                while(num4 == randNum4) {
                    num4 = Int(arc4random_uniform(UInt32(shapeArray.count)))
                }
            }
            else if (score >= 21 && score < 51)
            {
                //colors
                num1 = Int(arc4random_uniform(UInt32(colorArray.count)))
                num2 = Int(arc4random_uniform(UInt32(colorArray.count)))
                num3 = Int(arc4random_uniform(UInt32(colorArray.count)))
                num4 = Int(arc4random_uniform(UInt32(colorArray.count)))
                
                while(num2 == randNum2) {
                    num2 = Int(arc4random_uniform(UInt32(colorArray.count)))
                }
                
                while(num3 == randNum3) {
                    num3 = Int(arc4random_uniform(UInt32(colorArray.count)))
                }
                
                while(num4 == randNum4) {
                    num4 = Int(arc4random_uniform(UInt32(colorArray.count)))
                }
            }
            else if (score >= 51 && score < 91)
            {
                //food
                num1 = Int(arc4random_uniform(UInt32(foodArray.count)))
                num2 = Int(arc4random_uniform(UInt32(foodArray.count)))
                num3 = Int(arc4random_uniform(UInt32(foodArray.count)))
                num4 = Int(arc4random_uniform(UInt32(foodArray.count)))
                
                while(num2 == randNum2) {
                    num2 = Int(arc4random_uniform(UInt32(foodArray.count)))
                }
                
                while(num3 == randNum3) {
                    num3 = Int(arc4random_uniform(UInt32(foodArray.count)))
                }
                
                while(num4 == randNum4) {
                    num4 = Int(arc4random_uniform(UInt32(foodArray.count)))
                }
            }
            else if (score >= 91 && score < 151)
            {
                //pics
                num1 = Int(arc4random_uniform(UInt32(picArray.count)))
                num2 = Int(arc4random_uniform(UInt32(picArray.count)))
                num3 = Int(arc4random_uniform(UInt32(picArray.count)))
                num4 = Int(arc4random_uniform(UInt32(picArray.count)))
                
                while(num2 == randNum2) {
                    num2 = Int(arc4random_uniform(UInt32(picArray.count)))
                }
                
                while(num3 == randNum3) {
                    num3 = Int(arc4random_uniform(UInt32(picArray.count)))
                }
                
                while(num4 == randNum4) {
                    num4 = Int(arc4random_uniform(UInt32(picArray.count)))
                }
            }
            else if (score >= 151)
            {
                //everything
                num1 = Int(arc4random_uniform(UInt32(evArray.count)))
                num2 = Int(arc4random_uniform(UInt32(evArray.count)))
                num3 = Int(arc4random_uniform(UInt32(evArray.count)))
                num4 = Int(arc4random_uniform(UInt32(evArray.count)))
                
                while(num2 == randNum2) {
                    num2 = Int(arc4random_uniform(UInt32(evArray.count)))
                }
                
                while(num3 == randNum3) {
                    num3 = Int(arc4random_uniform(UInt32(evArray.count)))
                }
                
                while(num4 == randNum4) {
                    num4 = Int(arc4random_uniform(UInt32(evArray.count)))
                }
            }
            
            //creates frame width pixel positions
            let frameWidth = Double(frame.width)
            let cp = CGFloat(frameWidth * correctPoint)
            let p2 = CGFloat(frameWidth * point2)
            let p3 = CGFloat(frameWidth * point3)
            let p4 = CGFloat(frameWidth * point4)
            
            //sets pic into their positions using the frame width from above
            correctPic.position = CGPointMake(cp, frame.height * 0.5)
            pic2.position = CGPointMake(p2, frame.height * 0.5)
            pic3.position = CGPointMake(p3, frame.height * 0.5)
            pic4.position = CGPointMake(p4, frame.height * 0.5)
            
            //adds all the pics into the view
            addChild(correctPic)
            addChild(pic2)
            addChild(pic3)
            addChild(pic4)
            
            //text under the pics
            if (score < 21)
            {
                //shapes
                colorText1.text = shapeArray[randNum1]
                colorText1.fontSize = 30
                colorText1.position = CGPointMake(cp, frame.height * 0.35)
                colorText2.text = shapeArray[num2]
                colorText2.fontSize = 30
                colorText2.position = CGPointMake(p2, frame.height * 0.35)
                colorText3.text = shapeArray[num3]
                colorText3.fontSize = 30
                colorText3.position = CGPointMake(p3, frame.height * 0.35)
                colorText4.text = shapeArray[num4]
                colorText4.fontSize = 30
                colorText4.position = CGPointMake(p4, frame.height * 0.35)
            }
            else if (score >= 21 && score < 51)
            {
                //colors
                colorText1.text = colorArray[randNum1]
                colorText1.fontSize = 30
                colorText1.position = CGPointMake(cp, frame.height * 0.35)
                colorText2.text = colorArray[num2]
                colorText2.fontSize = 30
                colorText2.position = CGPointMake(p2, frame.height * 0.35)
                colorText3.text = colorArray[num3]
                colorText3.fontSize = 30
                colorText3.position = CGPointMake(p3, frame.height * 0.35)
                colorText4.text = colorArray[num4]
                colorText4.fontSize = 30
                colorText4.position = CGPointMake(p4, frame.height * 0.35)
            }
            else if (score >= 51 && score < 91)
            {
                //food
                colorText1.text = foodArray[randNum1]
                colorText1.fontSize = 30
                colorText1.position = CGPointMake(cp, frame.height * 0.35)
                colorText2.text = foodArray[num2]
                colorText2.fontSize = 30
                colorText2.position = CGPointMake(p2, frame.height * 0.35)
                colorText3.text = foodArray[num3]
                colorText3.fontSize = 30
                colorText3.position = CGPointMake(p3, frame.height * 0.35)
                colorText4.text = foodArray[num4]
                colorText4.fontSize = 30
                colorText4.position = CGPointMake(p4, frame.height * 0.35)
            }
            else if (score >= 91 && score < 151)
            {
                //pics
                colorText1.text = picArray[randNum1]
                colorText1.fontSize = 30
                colorText1.position = CGPointMake(cp, frame.height * 0.35)
                colorText2.text = picArray[num2]
                colorText2.fontSize = 30
                colorText2.position = CGPointMake(p2, frame.height * 0.35)
                colorText3.text = picArray[num3]
                colorText3.fontSize = 30
                colorText3.position = CGPointMake(p3, frame.height * 0.35)
                colorText4.text = picArray[num4]
                colorText4.fontSize = 30
                colorText4.position = CGPointMake(p4, frame.height * 0.35)
            }
            else if (score >= 151)
            {
                //everything
                colorText1.text = evArray[randNum1]
                colorText1.fontSize = 30
                colorText1.position = CGPointMake(cp, frame.height * 0.35)
                colorText2.text = evArray[num2]
                colorText2.fontSize = 30
                colorText2.position = CGPointMake(p2, frame.height * 0.35)
                colorText3.text = evArray[num3]
                colorText3.fontSize = 30
                colorText3.position = CGPointMake(p3, frame.height * 0.35)
                colorText4.text = evArray[num4]
                colorText4.fontSize = 30
                colorText4.position = CGPointMake(p4, frame.height * 0.35)
            }
            
            let col1 = Int(arc4random_uniform(UInt32(10)))
            let col2 = Int(arc4random_uniform(UInt32(10)))
            let col3 = Int(arc4random_uniform(UInt32(10)))
            let col4 = Int(arc4random_uniform(UInt32(10)))
            
            if (col1 == 0)
            {
                colorText1.fontColor = SKColor.blackColor()
            } else if (col1 == 1) {
                colorText1.fontColor = SKColor.blueColor()
            } else if (col1 == 2) {
                colorText1.fontColor = SKColor.brownColor()
            } else if (col1 == 3) {
                colorText1.fontColor = SKColor.greenColor()
            } else if (col1 == 4) {
                colorText1.fontColor = SKColor.orangeColor()
            } else if (col1 == 5) {
                colorText1.fontColor = SKColor.magentaColor()
            } else if (col1 == 6) {
                colorText1.fontColor = SKColor.purpleColor()
            } else if (col1 == 7) {
                colorText1.fontColor = SKColor.redColor()
            } else if (col1 == 8) {
                colorText1.fontColor = SKColor.yellowColor()
            } else if (col1 == 9) {
                colorText1.fontColor = SKColor.whiteColor()
            }
            
            if (col2 == 0)
            {
                colorText2.fontColor = SKColor.blackColor()
            } else if (col2 == 1) {
                colorText2.fontColor = SKColor.blueColor()
            } else if (col2 == 2) {
                colorText2.fontColor = SKColor.brownColor()
            } else if (col2 == 3) {
                colorText2.fontColor = SKColor.greenColor()
            } else if (col2 == 4) {
                colorText2.fontColor = SKColor.orangeColor()
            } else if (col2 == 5) {
                colorText2.fontColor = SKColor.magentaColor()
            } else if (col2 == 6) {
                colorText2.fontColor = SKColor.purpleColor()
            } else if (col2 == 7) {
                colorText2.fontColor = SKColor.redColor()
            } else if (col2 == 8) {
                colorText2.fontColor = SKColor.yellowColor()
            } else if (col1 == 9) {
                colorText2.fontColor = SKColor.whiteColor()
            }
            
            if (col3 == 0)
            {
                colorText3.fontColor = SKColor.blackColor()
            } else if (col3 == 1) {
                colorText3.fontColor = SKColor.blueColor()
            } else if (col3 == 2) {
                colorText3.fontColor = SKColor.brownColor()
            } else if (col3 == 3) {
                colorText3.fontColor = SKColor.greenColor()
            } else if (col3 == 4) {
                colorText3.fontColor = SKColor.orangeColor()
            } else if (col3 == 5) {
                colorText3.fontColor = SKColor.magentaColor()
            } else if (col3 == 6) {
                colorText3.fontColor = SKColor.purpleColor()
            } else if (col3 == 7) {
                colorText3.fontColor = SKColor.redColor()
            } else if (col3 == 8) {
                colorText3.fontColor = SKColor.yellowColor()
            } else if (col1 == 9) {
                colorText3.fontColor = SKColor.whiteColor()
            }
            
            if (col4 == 0)
            {
                colorText4.fontColor = SKColor.blackColor()
            } else if (col4 == 1) {
                colorText4.fontColor = SKColor.blueColor()
            } else if (col4 == 2) {
                colorText4.fontColor = SKColor.brownColor()
            } else if (col4 == 3) {
                colorText4.fontColor = SKColor.greenColor()
            } else if (col4 == 4) {
                colorText4.fontColor = SKColor.orangeColor()
            } else if (col4 == 5) {
                colorText4.fontColor = SKColor.magentaColor()
            } else if (col4 == 6) {
                colorText4.fontColor = SKColor.purpleColor()
            } else if (col4 == 7) {
                colorText4.fontColor = SKColor.redColor()
            } else if (col4 == 8) {
                colorText4.fontColor = SKColor.yellowColor()
            } else if (col1 == 9) {
                colorText4.fontColor = SKColor.whiteColor()
            }
            
            addChild(colorText1)
            addChild(colorText2)
            addChild(colorText3)
            addChild(colorText4)
            
            //saves the high score
            let HighScoreDefault = NSUserDefaults.standardUserDefaults()
            if (HighScoreDefault.valueForKey("highScore") != nil) {
                highScore = HighScoreDefault.valueForKey("highScore") as! NSInteger!
                highScoreText.text = String(format: "High Score: %i", highScore)
            }
            
            moveOn = false
        }
    }
}
