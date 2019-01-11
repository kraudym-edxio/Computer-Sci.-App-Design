//
//  Settings.swift
//  ColourSwitch
//
//  Created by Edxio Kraudy on 2019-01-03.
//  Copyright © 2019 Edxio Kraudy. All rights reserved.
//

import SpriteKit

enum PhysicsCategories {
    static let none: UInt32 = 0
    static let ballCategory: UInt32 = 0x1           //01
    static let switchCategory: UInt32 = 0x1 << 1    //10
}

enum ZPositions {
    static let label: CGFloat = 0
    static let ball: CGFloat = 1
    static let colourSwitch: CGFloat = 2
    
}
