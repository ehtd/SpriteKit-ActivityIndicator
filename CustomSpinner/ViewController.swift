//
//  ViewController.swift
//  CustomSpinner
//
//  Created by Ernesto Torres on 6/4/17.
//  Copyright © 2017 ehtd. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController {

    fileprivate let width: CGFloat = 74
    fileprivate let height: CGFloat = 55

    fileprivate var animating = false {
        didSet {
            if animating {
                activityIndicatorScene?.startAnimating()
            } else {
                activityIndicatorScene?.stopAnimating()
            }
        }
    }
    fileprivate let skView: SKView = {
        let view = SKView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.allowsTransparency = true
        
        return view
    }()

    fileprivate var activityIndicatorScene: ActivityIndicatorScene? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        let tap = UITapGestureRecognizer(target: self, action: #selector(toggleAnimation))
        view.addGestureRecognizer(tap)

        view.addSubview(skView)
        skView.widthAnchor.constraint(equalToConstant: width).isActive = true
        skView.heightAnchor.constraint(equalToConstant: height).isActive = true
        skView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        skView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        activityIndicatorScene = ActivityIndicatorScene(size: CGSize(width: width, height: height))
        activityIndicatorScene?.scaleMode = .fill
        skView.presentScene(activityIndicatorScene)
    }
}

extension ViewController {
    @objc func toggleAnimation() {
        animating = !animating
    }
}

