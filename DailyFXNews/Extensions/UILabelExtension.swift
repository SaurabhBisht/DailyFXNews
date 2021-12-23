//
//  UILabelExtension.swift
//  DailyFXNews
//
//  Created by Saurabh Bisht on 23/12/2021.
//

import UIKit

extension UILabel {
    func addCharacterSpacing(kernValue: Double = 1.15) {
        if let labelText = text, labelText.count > 0 {
            let attributedString = NSMutableAttributedString(string: labelText)
            attributedString.addAttribute(.kern, value: kernValue, range: NSRange(location: 0, length: attributedString.length - 1))
            attributedText = attributedString
        }
    }
}
