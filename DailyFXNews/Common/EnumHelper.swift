//
//  EnumHelper.swift
//  DailyFXNews
//
//  Created by Saurabh Bisht on 23/12/2021.
//

import Foundation

enum NewsType: Int {
    case breakingNews
    case topNews
    case technicalAnalysis
    case specialReport
}

enum Section: Int {
    case breakingNews
    case topNews
    case technicalAnalysis
    case specialReport
    
    init?(indexPath: NSIndexPath) {
        self.init(rawValue: indexPath.section)
    }

    static var numberOfSections: Int { return 4 }
}
