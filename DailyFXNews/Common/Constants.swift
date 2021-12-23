//
//  Constants.swift
//  DailyFXNews
//
//  Created by Saurabh Bisht on 22/12/2021.
//

import Foundation

class Constants {
    struct Endpoints {
        static var baseDataURL = "https://content.dailyfx.com/api/v1/dashboard"
    }
    
    struct NavigationTitles{
        static var MASTER_TITLE = "NEWS Details"
        static var DETAIL_TITLE = "Daily FX News"
    }
    
    struct NewsTypes{
        static var BREAKING_NEWS = "Breaking News"
        static var TOP_NEWS = "Top News"
        static var ANALYSIS_NEWS = "Technical Analysis"
        static var SPECIAL_NEWS = "Special Report"
    }
    
    struct CommonText{
        static var NO_DATA = "No Data"
        static var EMPTY = ""
        static var ERROR = "Error"
        
    }
    
}
