//
//  GameViewController.swift
//  ColourSwitch
//
//  Created by Edxio Kraudy on 2019-01-02.
//  Copyright © 2019 Edxio Kraudy. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            let scene = MenuScene(size: view.bounds.size)
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            
            
                view.ignoresSiblingOrder = true
            
                view.showsFPS = false
                view.showsNodeCount = false
            }
        }

}
