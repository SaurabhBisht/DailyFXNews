//
//  BaseViewController.swift
//  DailyFXNews
//
//  Created by Saurabh Bisht on 23/12/2021.
//

import Foundation
import UIKit

class BaseViewController:UIViewController{
    
    var baseNewsViewModel = BaseNewsViewModel()
    var baseNewsModel: BaseNewsModel?
    var activityIndicator = UIActivityIndicatorView(style: .large)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLoader(vw: self.view)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    fileprivate func setLoader(vw: UIView) {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        vw.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: vw.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: vw.centerYAnchor).isActive = true
    }
    
    func beginLoad() {
        activityIndicator.startAnimating()
    }
    
    func endLoad() {
        activityIndicator.stopAnimating()
    }
}
