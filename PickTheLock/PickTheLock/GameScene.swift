//
//  GameScene.swift
//  PickTheLock
//
//  Created by Edxio Kraudy on 2019-01-09.
//  Copyright © 2019 Edxio Kraudy. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var Circle = SKSpriteNode()
    var Person = SKSpriteNode()
    var Dot = SKSpriteNode()
    
    var Path = UIBezierPath()
    
    var gameStarted = Bool()
    
    var movingClockwise = Bool()
    var intersected = false
    
    var LevelLabel = UILabel()
    
    var currentLevel = Int()
    var currentScore =  Int()
    var highLevel = Int()
    
    override func didMove(to view: SKView) {
        
        loadView()
        
        let Defaults = UserDefaults.standard
        
        if Defaults.integer(forKey: "HighLevel") != 0 {
            highLevel = Defaults.integer(forKey: "HighLevel") as Int
            currentLevel = highLevel
            currentScore = currentLevel
            LevelLabel.text = "\(currentScore)"
        }
        
        else {
            Defaults.set(1, forKey: "HighLevel")
        }
        
    }
    
    func loadView() {
        
        movingClockwise = true
        backgroundColor = SKColor.white
        Circle = SKSpriteNode(imageNamed: "Circle")
        Circle.size = CGSize(width: 300, height: 300)
        Circle.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        addChild(Circle)
        
        Person = SKSpriteNode(imageNamed: "Person")
        Person.size = CGSize(width: 40, height: 7)
        Person.position = CGPoint(x: self.frame.midX, y: self.frame.midY + 129)
        Person.zRotation = .pi / 2
        Person.zPosition = 2.0
        addChild(Person)
        AddDot()
        
        LevelLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 150, height: 100))
        LevelLabel.center = (self.view?.center)!
        LevelLabel.text = "\(currentScore)"
        LevelLabel.textColor = SKColor.darkGray
        LevelLabel.textAlignment = NSTextAlignment.center
        LevelLabel.font = UIFont.systemFont(ofSize: 60)
        self.view?.addSubview(LevelLabel)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
        if gameStarted == false {
            moveClockwise()
            movingClockwise = true
            gameStarted = true
        }
        
        else if gameStarted == true {
            
            if movingClockwise == true {
                moveCounterClockwise()
                movingClockwise = false
            }
            
            else if movingClockwise == false {
                moveClockwise()
                movingClockwise = true
            }
            
            DotTouched()
            
        }
        
    }
    
    func AddDot() {
        
        Dot = SKSpriteNode(imageNamed: "Dot")
        Dot.size = CGSize(width: 32, height: 32)
        Dot.zPosition = 1.0
        
        let dx = Person.position.x - self.frame.midX
        let dy = Person.position.y - self.frame.midY
        
        let rad = atan2(dy, dx)
        
        if movingClockwise == true {
            let tempAngle = CGFloat.random(min: rad - 1.0, max: rad - 2.5)
            
            let Path2 = UIBezierPath(arcCenter: CGPoint(x: self.frame.midX, y: self.frame.midY), radius: 129, startAngle: tempAngle, endAngle: tempAngle + CGFloat(Double.pi * 4), clockwise: true)
            
            Dot.position = Path2.currentPoint
        }
        
        else if movingClockwise == false {
            let tempAngle = CGFloat.random(min: rad + 1.0, max: rad + 2.5)
            
            let Path2 = UIBezierPath(arcCenter: CGPoint(x: self.frame.midX, y: self.frame.midY), radius: 129, startAngle: tempAngle, endAngle: tempAngle + CGFloat(Double.pi * 4), clockwise: true)
            
            Dot.position = Path2.currentPoint
        }
        
        addChild(Dot)
        
    }
    
    func moveClockwise() {
        
        let dx = Person.position.x - self.frame.midX
        let dy = Person.position.y - self.frame.midY
        
        let rad = atan2(dy, dx)
        
        Path = UIBezierPath(arcCenter: CGPoint(x: self.frame.midX, y: self.frame.midY), radius: 129, startAngle: rad, endAngle: rad + CGFloat(Double.pi * 4), clockwise: true)
        
        let follow = SKAction.follow(Path.cgPath, asOffset: false, orientToPath: true, speed: 210)
        Person.run(SKAction.repeatForever(follow).reversed())
        
    }
    
    func moveCounterClockwise() {
        
        let dx = Person.position.x - self.frame.midX
        let dy = Person.position.y - self.frame.midY
        
        let rad = atan2(dy, dx)
        
        Path = UIBezierPath(arcCenter: CGPoint(x: self.frame.midX, y: self.frame.midY), radius: 129, startAngle: rad, endAngle: rad + CGFloat(Double.pi * 4), clockwise: true)
        
        let follow = SKAction.follow(Path.cgPath, asOffset: false, orientToPath: true, speed: 210)
        Person.run(SKAction.repeatForever(follow))
        
    }
    
    func DotTouched() {
        if intersected == true {
            Dot.removeFromParent()
            AddDot()
            intersected = false
            
                                                                    currentScore -= 1
            LevelLabel.text = "\(currentScore)"
            if currentScore <= 0 {
                nextLevel()
            }
            
        }
        
        else if intersected == false {
            died()
        }
    }
    
    func nextLevel() {
                                                                    currentLevel += 1
        currentScore = currentLevel
        LevelLabel.text = "\(currentScore)"
        won()
        
        if currentLevel > highLevel{
            highLevel = currentLevel
            let Defaults = UserDefaults.standard
            Defaults.set(highLevel, forKey: "HighLevel")
        }
        
    }
    
    func died() {
        self.removeAllChildren()
        let action1 = SKAction.colorize(with: UIColor.red, colorBlendFactor: 1.0, duration: 0.2)
        let action2 = SKAction.colorize(with: UIColor.white, colorBlendFactor: 1.0, duration: 0.2)
        self.scene?.run(SKAction.sequence([action1, action2]))
        intersected = false
        gameStarted = false
        LevelLabel.removeFromSuperview()
        currentScore = currentLevel
        self.loadView()
    }
    
    func won() {
        self.removeAllChildren()
        let action1 = SKAction.colorize(with: UIColor.green, colorBlendFactor: 1.0, duration: 0.2)
        let action2 = SKAction.colorize(with: UIColor.white, colorBlendFactor: 1.0, duration: 0.2)
        self.scene?.run(SKAction.sequence([action1, action2]))
        intersected = false
        gameStarted = false
        LevelLabel.removeFromSuperview()
        self.loadView()
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        if Person.intersects(Dot) {
            intersected = true
        }
        
        else {
            
            if intersected == true {
                
                if Person.intersects(Dot) == false {
                    died()
                    
                }
            }
        }
        
    }
}
