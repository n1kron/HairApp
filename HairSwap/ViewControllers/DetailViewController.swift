//
//  DetailViewController.swift
//  HairSwap
//
//  Created by  Kostantin Zarubin on 26/11/2018.
//  Copyright © 2018  Kostantin Zarubin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var backView: UIView!
    
    var image: UIImage!
    var titleText = ""
    var mainText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        backView.layer.cornerRadius = 10.0
        mainImageView.layer.cornerRadius = mainImageView.frame.size.width / 2
        mainImageView.layer.borderWidth = 3.0
        mainImageView.layer.borderColor = UIColor.white.cgColor
        mainImageView.image = image
        titleLabel.text = titleText
        textView.text = mainText
    }
}
