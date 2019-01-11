//
//  GameViewController.swift
//  PickTheLock
//
//  Created by Edxio Kraudy on 2019-01-09.
//  Copyright © 2019 Edxio Kraudy. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import AVFoundation

class GameViewController: UIViewController {
    
    var backgroundMusicPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                
                let bgMusicURL = Bundle.main.url(forResource: "BGMusicSounds", withExtension: "wav")
                
                do {
                    try backgroundMusicPlayer = AVAudioPlayer(contentsOf: bgMusicURL!)
                }
                catch {
                    print("cant play music")
                }
                
                backgroundMusicPlayer.numberOfLoops = -1
                backgroundMusicPlayer.prepareToPlay()
                backgroundMusicPlayer.play()
                
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = false
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}

