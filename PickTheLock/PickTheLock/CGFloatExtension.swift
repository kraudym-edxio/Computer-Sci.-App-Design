//
//  CGFloatExtension.swift
//  PickTheLock
//
//  Created by Edxio Kraudy on 2019-01-09.
//  Copyright © 2019 Edxio Kraudy. All rights reserved.
//

import Foundation
import CoreGraphics

public extension CGFloat {
    
    public static func random() -> CGFloat {
        
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
        
    }
    
    public static func random(min: CGFloat, max: CGFloat) -> CGFloat {
        
        return CGFloat.random() * (max - min) + min
        
    }
    
}
