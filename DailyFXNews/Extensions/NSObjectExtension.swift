//
//  NSObjectExtension.swift
//  DailyFXNews
//
//  Created by Saurabh Bisht on 22/12/2021.
//

import UIKit

extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}
