//
//  Asteroid.swift
//  SpaceShooter
//
//  Created by Michael Blatter on 2/28/19.
//  Copyright © 2019 blatter. All rights reserved.
//

import SpriteKit

struct Asteroid: Equatable, Sprite {
    internal let size = CGSize(width: 100, height: 100)
    internal let spriteNode: SKSpriteNode
    internal let texture = SKTexture(imageNamed: "Asteroid")
    
    public init(position: CGPoint) {
        spriteNode = SKSpriteNode(texture: texture, size: size)
        spriteNode.position = position
        spriteNode.physicsBody = SKPhysicsBody(circleOfRadius: max(size.width / 2, size.height / 2))
    }
}