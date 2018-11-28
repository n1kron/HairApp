//
//  Size.swift
//  HairSwap
//
//  Created by  Kostantin Zarubin on 21/11/2018.
//  Copyright © 2018  Kostantin Zarubin. All rights reserved.
//

import UIKit

class Sizes {
    static func cell(constWidthKoef: CGFloat, constHeightKoef: CGFloat, iphoneXWidthKoef: CGFloat, iphoneXHeightKoef: CGFloat) -> CGSize {
        if UIScreen.main.bounds.size.height == 812.0 {
            return CGSize(width: UIScreen.main.bounds.width / iphoneXWidthKoef, height: UIScreen.main.bounds.height / iphoneXHeightKoef)
        }
        return CGSize(width: UIScreen.main.bounds.width / constWidthKoef, height: UIScreen.main.bounds.height / constHeightKoef)
    }
    
    static func tableCell (heightTableMainKoef: CGFloat, heightTableMainKoefForIpad: CGFloat) -> CGFloat {
        if UIDevice.current.model.range(of: "iPad") != nil {
            return UIScreen.main.bounds.height / heightTableMainKoefForIpad
        }
        return UIScreen.main.bounds.height / heightTableMainKoef
    }
}
