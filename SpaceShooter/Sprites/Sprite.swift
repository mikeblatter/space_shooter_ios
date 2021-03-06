//
//  Sprite.swift
//  SpaceShooter
//
//  Created by Michael Blatter on 2/28/19.
//  Copyright © 2019 blatter. All rights reserved.
//

import SpriteKit

let degreesToRadians = CGFloat.pi / 180

class Sprite: CollisionIdentification {
    public let uniqueName = UUID().uuidString
    public let spriteNode: SKSpriteNode
    public let collisionType: CollisionType
    
    public var angle: CGFloat = 0
    public var previousAngle: CGFloat = 0
    
    public init(spriteNode: SKSpriteNode, collisionType: CollisionType) {
        self.spriteNode = spriteNode
        self.collisionType = collisionType
        
        // Set unique name to sprite node
        self.spriteNode.name = uniqueName
    }
    
    public func delta(to otherPosition: CGPoint) -> CGVector {
        return CGVector(dx: spriteNode.position.x + otherPosition.x, dy: spriteNode.position.y + otherPosition.y)
    }
    
    public func direction(to possibleOtherPosition: CGPoint) -> CGFloat {
        let rotationBlendFactor: CGFloat = 0.2
        
        let delta = self.delta(to: possibleOtherPosition)
        
        angle = atan2(delta.dy, delta.dx)
        
        // did angle flip from +π to -π, or -π to +π?
        if angle - previousAngle > CGFloat.pi {
            angle += 2 * CGFloat.pi
        } else if previousAngle - angle > CGFloat.pi {
            angle -= 2 * CGFloat.pi
        }
        
        previousAngle = angle
        angle = angle * rotationBlendFactor + angle * (1 - rotationBlendFactor)
        
        // convert to radians
        return angle - 90 * degreesToRadians
    }
    
    public func add(to scene: SKScene) {
        scene.addChild(spriteNode)
    }
}
