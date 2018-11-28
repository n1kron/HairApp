//
//  Background.swift
//  SexStories
//
//  Created by  Kostantin Zarubin on 13/11/2018.
//  Copyright © 2018  Kostantin Zarubin. All rights reserved.
//

import UIKit

class Background: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        let gradientLayer:CAGradientLayer = CAGradientLayer()
        gradientLayer.frame.size = UIScreen.main.bounds.size
        gradientLayer.colors = [UIColor(red: 187.0/255.0, green: 54.0/255.0, blue: 64.0/255.0, alpha: 1.0).cgColor ,UIColor(red: 255.0/255.0, green: 250.0/255.0, blue: 84.0/255.0, alpha: 1.0).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
