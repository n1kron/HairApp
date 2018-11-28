//
//  ViewController.swift
//  HairSwap
//
//  Created by  Kostantin Zarubin on 21/11/2018.
//  Copyright © 2018  Kostantin Zarubin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    struct Consts {
        static let heightTableMainKoef: CGFloat = 3.51053
        static let heightTableMainKoefForIpad: CGFloat = 3.41053
        static let heightTableSmallKoef: CGFloat = 3.92352
        static let heightTableSmallKoefForIpad: CGFloat = 3.76352
        
        static let iphoneXWidthMainKoef: CGFloat = 1.1
        static let widthMainCardKoef: CGFloat = 1.1194
        static let heigthMainCardKoef: CGFloat = 3.70556
        
        static let minimumLineSpacing: CGFloat = 10
        static let insetForSection = UIEdgeInsets(top: 0, left: UIScreen.main.bounds.size.width / 18.75, bottom: 0, right: UIScreen.main.bounds.size.width / 18.75)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            if let vc = segue.destination as? DetailViewController {
                let test = sender as! [Int:Int]
                if let index = test.values.first {
                    if let tag = test.keys.first {
                        vc.titleText = Content.titles[tag][index]
                        vc.image = UIImage(named: Content.images[tag][index])
                        vc.mainText = Content.text[tag][index]
                    }
                }
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Content.headers.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CollectionHeaderCell") as! CollectionHeaderCell
        cell.title = Content.headers[section]
        cell.layoutIfNeeded()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UIScreen.main.bounds.height / 13.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HairCollectionCell") as! HairCollectionCell
        cell.hairCollectionView.delegate = self
        cell.hairCollectionView.dataSource = self
        cell.hairCollectionView.tag = indexPath.section
        cell.hairCollectionView.reloadData()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Sizes.tableCell(heightTableMainKoef: Consts.heightTableMainKoef, heightTableMainKoefForIpad: Consts.heightTableMainKoefForIpad)
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as! CollectionCell
        cell.backgroundImage.image = UIImage(named: Content.images[collectionView.tag][indexPath.row])
        cell.titleLabel.text = Content.titles[collectionView.tag][indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dictSendData: [Int:Int] = [collectionView.tag : indexPath.row]
        performSegue(withIdentifier: "ShowDetail", sender: dictSendData)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return Sizes.cell(constWidthKoef: Consts.widthMainCardKoef, constHeightKoef: Consts.heigthMainCardKoef, iphoneXWidthKoef: Consts.iphoneXWidthMainKoef, iphoneXHeightKoef: Consts.heigthMainCardKoef)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Consts.minimumLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return Consts.insetForSection
    }
}

class CustomCollectionViewFlowLayout: UICollectionViewFlowLayout {
    var mostRecentOffset : CGPoint = CGPoint()
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        
        if velocity.x == 0 {
            return mostRecentOffset
        }
        if let cv = self.collectionView {
            let cvBounds = cv.bounds
            let halfWidth = cvBounds.size.width * 0.5;
            if let attributesForVisibleCells = self.layoutAttributesForElements(in: cvBounds) {
                var candidateAttributes : UICollectionViewLayoutAttributes?
                for attributes in attributesForVisibleCells {
                    if attributes.representedElementCategory != UICollectionView.ElementCategory.cell {
                        continue
                    }
                    if (attributes.center.x == 0) || (attributes.center.x > (cv.contentOffset.x + halfWidth) && velocity.x < 0) {
                        continue
                    }
                    candidateAttributes = attributes
                }
                if(proposedContentOffset.x == -(cv.contentInset.left)) {
                    return proposedContentOffset
                }
                guard let _ = candidateAttributes else {
                    return mostRecentOffset
                }
                mostRecentOffset = CGPoint(x: floor(candidateAttributes!.center.x - halfWidth), y: proposedContentOffset.y)
                return mostRecentOffset
            }
        }
        mostRecentOffset = super.targetContentOffset(forProposedContentOffset: proposedContentOffset)
        return mostRecentOffset
    }
}

