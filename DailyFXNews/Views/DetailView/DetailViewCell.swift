//
//  DetailViewCell.swift
//  DailyFXNews
//
//  Created by Saurabh Bisht on 22/12/2021.
//

import Foundation
import UIKit

class DetailViewCell: UITableViewCell {
    @IBOutlet weak var imageVw: UIImageView!
    var onContinueClick : ((_ sender: UIButton) -> Void)?
    
    // MARK: - View method
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    // MARK: - Action handler
    @IBAction func onContinueClick(_ sender: UIButton) {
        onContinueClick?(sender)
    }
}

