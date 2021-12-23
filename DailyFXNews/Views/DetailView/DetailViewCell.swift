//
//  DetailViewCell.swift
//  DailyFXNews
//
//  Created by Saurabh Bisht on 22/12/2021.
//

import Foundation
import UIKit

class DetailViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var imageVw: UIImageView!
    @IBOutlet weak var subtitleLbl: UILabel!
    @IBOutlet weak var layerView: UIView!
    @IBOutlet weak var vedioView: UIView!
    @IBOutlet weak var photoView: UIView!
    @IBOutlet weak var vedioFrame: UIView!
    
    var onContinueClick : ((_ sender: UIButton) -> Void)?
    var onVedioClick : ((_ sender: UIButton) -> Void)?
    
    
    // MARK: - View method
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layerView.layer.borderColor  = UIColor(red: 226/255.0, green: 226/255.0, blue: 226/255.0, alpha: 1).cgColor
        self.layerView.layer.borderWidth  = 0.5
        self.layerView.layer.cornerRadius = 8
        selectionStyle = .none
    }
    // MARK: - Action handler
    @IBAction func onVedioClick(_ sender: UIButton) {
        onVedioClick?(sender)
    }
    @IBAction func onContinueClick(_ sender: UIButton) {
        onContinueClick?(sender)
    }
}

