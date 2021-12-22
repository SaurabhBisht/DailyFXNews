//
//  NewCategoryFlowLayout.swift
//  DailyFXNews
//
//  Created by Saurabh Bisht on 22/12/2021.
//

import Foundation
import UIKit

class ColumnFlowLayout: UICollectionViewFlowLayout, UICollectionViewDelegateFlowLayout{
    let margin: CGFloat = 8
    override func prepare() {
        super.prepare()
        guard let cv = collectionView else {return}
        insetFromSafeArea()
        scrollDirection = .vertical
        cv.showsHorizontalScrollIndicator = false
        cv.alwaysBounceVertical           = true
        cv.backgroundColor                = UIColor.clear
        cv.showsVerticalScrollIndicator   = false
        cv.alwaysBounceVertical           = false
        cv.contentInset.left              = .zero
        
      
        minimumInteritemSpacing = margin
        minimumLineSpacing = margin
        sectionInset = UIEdgeInsets(top: margin, left: margin, bottom: margin, right: margin)
        headerReferenceSize = CGSize(width: UIScreen.main.bounds.width - 16, height: 60)
    }
    
    fileprivate func insetFromSafeArea() {
        self.sectionInset = UIEdgeInsets(top: self.minimumInteritemSpacing, left: 0.0, bottom: 0.0, right: 0.0)
        if #available(iOS 11.0, *) {
            self.sectionInsetReference = .fromSafeArea
        } else {}
    }
}
