//
//  Cells.swift
//  HairSwap
//
//  Created by  Kostantin Zarubin on 21/11/2018.
//  Copyright © 2018  Kostantin Zarubin. All rights reserved.
//

import UIKit

class CollectionHeaderCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    var title = ""
    
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.text = title
    }
}

class CollectionCell: UICollectionViewCell {
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var blurView: UIVisualEffectView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        blurView.effect = UIBlurEffect(style: .dark)
        self.layer.cornerRadius = 10.0
    }
}

class HairCollectionCell : UITableViewCell {
    @IBOutlet weak var hairCollectionView: UICollectionView!
    
}

class SettingsTableViewCell: UITableViewCell {
    
}
