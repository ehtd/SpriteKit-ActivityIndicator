//
//  ActivityIndicatorScene.swift
//  CustomSpinner
//
//  Created by Ernesto Torres on 6/4/17.
//  Copyright © 2017 ehtd. All rights reserved.
//

import SpriteKit

class ActivityIndicatorScene: SKScene {

    fileprivate var animating = false

    fileprivate let textures: [SKTexture] = {
        let images: [String] = ["dinosaur_00", "dinosaur_01", "dinosaur_00", "dinosaur_02",
                                "dinosaur_00", "dinosaur_01", "dinosaur_00", "dinosaur_02",
                                "dinosaur_00", "dinosaur_01", "dinosaur_00", "dinosaur_02",
                                "dinosaur_06", "dinosaur_07",
                                "dinosaur_06", "dinosaur_07",
                                "dinosaur_06", "dinosaur_07",
                                "dinosaur_10", "dinosaur_11",
                                "dinosaur_10", "dinosaur_11",]
        var textures = [SKTexture]()
        for i in images {
            let texture = SKTexture(imageNamed: i)
            textures.append(texture)
        }

        return textures
    }()

    fileprivate let activityIndicatorNode: SKSpriteNode = {
        let node = SKSpriteNode(imageNamed: "dinosaur_00")
        node.anchorPoint = CGPoint(x: 0, y: 0)
        node.position = CGPoint(x: 0, y: 0)
        return node
    }()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    override init(size: CGSize) {
        super.init(size: size)
        setup()
    }
}

extension ActivityIndicatorScene {
    func setup() {
        addChild(activityIndicatorNode)
        backgroundColor = .clear
    }
}

extension ActivityIndicatorScene {
    func startAnimating() {
        guard animating == false else { return }

        animating = true

        let animate = SKAction.animate(with: textures, timePerFrame: 0.2)
        activityIndicatorNode.run(animate) { [weak self] in
            self?.animating = false
            self?.startAnimating()
        }
    }

    func stopAnimating() {
        animating = false
        activityIndicatorNode.texture = SKTexture(imageNamed: "dinosaur_00")
        activityIndicatorNode.removeAllActions()
    }
}
