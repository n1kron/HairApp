//
//  SettingsViewController.swift
//  SexStories
//
//  Created by  Kostantin Zarubin on 15/11/2018.
//  Copyright © 2018  Kostantin Zarubin. All rights reserved.
//

import UIKit
import StoreKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: .zero)
    }
    
    func openUrl(urlString:String!) {
        let url = URL(string: urlString)!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
}

extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell", for: indexPath) as! SettingsTableViewCell
        cell.textLabel?.font = UIFont(name: "HelveticaNeue-Bold", size: 20.0)
        cell.textLabel?.textColor = UIColor.white
        switch indexPath.row {
        case 0 : cell.imageView?.image = UIImage(named: "rate")
        cell.textLabel?.text = "Rate App"
        case 1 : cell.imageView?.image = UIImage(named: "share")
        cell.textLabel?.text = "Share"
        case 2 : cell.imageView?.image = UIImage(named: "privacy")
        cell.textLabel?.text = "Privacy policy"
        case 3 : cell.imageView?.image = UIImage(named: "term")
        cell.textLabel?.text = "Term of use"
        default : return cell
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.size.height / 7
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch indexPath.row {
        case 0 :
            if #available( iOS 10.3,*) {
                SKStoreReviewController.requestReview()
            } else {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(URL(string: "")!, options: [:], completionHandler: nil)
                } else {
                    // Fallback on earlier versions
                } // update ref
            }
        case 1 :
            let shareText = "" // update ref
            let vc = UIActivityViewController(activityItems: [shareText], applicationActivities: [])
            self.present(vc, animated: true)
        case 2 :
            openUrl(urlString: "http://104.236.106.86/politics.html") // change reference
        case 3 :
            openUrl(urlString: "http://104.236.106.86/po.html") // change reference
        default: return
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor.clear
    }
}
