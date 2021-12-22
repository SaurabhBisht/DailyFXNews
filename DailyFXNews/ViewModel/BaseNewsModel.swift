//
//  BaseNewsModel.swift
//  DailyFXNews
//
//  Created by Saurabh Bisht on 22/12/2021.
//

import Foundation

struct BaseNewsModel{
    
    struct baseResult {
        var topNews = [detail]()
        var dailyBriefings = [dailybriefings]()
        var technicalAnalysis = [detail]()
        var specialReport = [detail]()
    }
    
    struct detail: Codable{
        var title = ""
        var url = ""
        var description =  ""
        var content =  ""
        var firstImageUrl =  ""
        var headlineImageUrl = ""
        var articleImageUrl =  ""
        var backgroundImageUrl = ""
        var videoType = ""
        var videoId = ""
        var videoUrl = ""
        var videoThumbnail = ""
        var newsKeywords = ""
        var author = [authors]()
        var instruments = ""
        var tags = [String]()
        var categories = [String]()
        var displayTimestamp = ""
        var lastUpdatedTimestamp = ""
        
    }
    
    struct authors: Codable{
        var name = ""
        var title = ""
        var bio =  ""
        var email =  ""
        var phone =  ""
        var facebook = ""
        var twitter =  ""
        var googleplus = ""
        var subscription = ""
        var rss = ""
        var descriptionLong = ""
        var descriptionShort = ""
        var photo = ""
        
    }
    
    struct dailybriefings: Codable{
        var eu = [detail]()
        var asia = [detail]()
        var us = [detail]()
    }
    
    struct specialreport: Codable{
        
    }
}
