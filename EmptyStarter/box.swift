//
//  box.swift
//  EmptyStarter
//
//

import UIKit
import SpriteKit

class Box: SKSpriteNode {
    init(screenSize: CGSize) {
        let boxSize = CGSize(width: 40, height: 40)
        super.init(texture: nil, color: .red, size: boxSize)
        name = "box"
        setup(screenSize: screenSize)
    }
    
    func setup(screenSize: CGSize) {
        let x = CGFloat( random(n: Int(screenSize.width)) + 20)
        position.x = x
        // Create an action to move the box up the screen
        let moveUp = SKAction.moveTo(y: screenSize.height, duration: 4)
        let seq = SKAction.sequence([moveUp, .removeFromParent()])
        run(seq)
        

    }
    
    // Returns a random int from 0 to n 1
    func random(n: Int) -> Int {
        return Int(arc4random()) % n
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
