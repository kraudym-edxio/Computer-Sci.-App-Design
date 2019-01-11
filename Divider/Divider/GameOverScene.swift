//
//  GameOverScene.swift
//  Divider
//
//  Created by Edxio Kraudy on 2019-01-09.
//  Copyright © 2019 Edxio Kraudy. All rights reserved.
//

import SpriteKit

class GameOverScene: SKScene {

        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }
        
        override init(size: CGSize) {
            super.init(size: size)
            
            self.backgroundColor = SKColor.black
            let message = "GAME OVER!"
            
            let label = SKLabelNode(fontNamed: "Optima-ExtraBlack")
            label.text = message
            label.fontSize = 100.0
            label.fontColor = SKColor.white
            label.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
            
            addChild(label)
        }
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            let transition = SKTransition.fade(withDuration: 0.5)
            let gameScene = GameScene(size: self.size)
            self.view?.presentScene(gameScene, transition: transition)
        }

}

