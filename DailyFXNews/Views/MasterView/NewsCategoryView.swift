//
//  NewsCategoryView.swift
//  DailyFXNews
//
//  Created by Saurabh Bisht on 22/12/2021.
//

import UIKit

class NewsCategoryView: UICollectionViewCell {
    
    @IBOutlet weak var layerView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var imageVw: UIImageView!
    @IBOutlet weak var noDataLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
    }
    
    fileprivate func setUp() {
        layer.shadowColor                 = UIColor(red: 226/255.0, green: 226/255.0, blue: 226/255.0, alpha: 0.6).cgColor
        layer.shadowOpacity               = 1
        layer.shadowOffset                = CGSize.zero
        layer.shadowRadius                = 3
        layer.cornerRadius                = 8
        layer.masksToBounds               = false
        
        self.layerView.layer.borderColor  = UIColor(red: 226/255.0, green: 226/255.0, blue: 226/255.0, alpha: 1).cgColor
        self.layerView.layer.borderWidth  = 0.5
        self.layerView.layer.cornerRadius = 8
    }
}
