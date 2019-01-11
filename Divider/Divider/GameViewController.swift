//
//  GameViewController.swift
//  Divider
//
//  Created by Edxio Kraudy on 2019-01-08.
//  Copyright © 2019 Edxio Kraudy. All rights reserved.
//

import UIKit
import SpriteKit
import AVFoundation

class GameViewController: UIViewController {
    
    var backgroundMusicPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let scene = GameScene(fileNamed:"GameScene") {
            
            let bgMusicURL = Bundle.main.url(forResource: "pixelMusic", withExtension: "wav")
            
            do {
                try backgroundMusicPlayer = AVAudioPlayer(contentsOf: bgMusicURL!)
            }
            catch {
                print("cant play music")
            }
            
            backgroundMusicPlayer.numberOfLoops = -1
            backgroundMusicPlayer.prepareToPlay()
            backgroundMusicPlayer.play()
            
            // Configure the view.
            let skView = self.view as! SKView
            //skView.showsFPS = true
            //skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .aspectFill
            
            skView.presentScene(scene)
        }
    }
}
