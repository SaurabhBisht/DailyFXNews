//
//  AlertHelper.swift
//  DailyFXNews
//
//  Created by Saurabh Bisht on 23/12/2021.
//

import UIKit

class AlertHelper {
    static func showAlert(title: String, message: String, controller:UIViewController) {
        let alert = UIAlertController(title: title , message: message , preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        controller.present(alert, animated: true, completion: nil)
    }
}

