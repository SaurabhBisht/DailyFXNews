//
//  BaseNewsModel.swift
//  DailyFXNews
//
//  Created by Saurabh Bisht on 22/12/2021.
//

import Foundation

    struct BaseNewsModel: Codable {
        var breakingNews: [detail]?
        var topNews: [detail]?
        var dailyBriefings: [dailybriefing]?
        var technicalAnalysis: [detail]?
        var specialReport: [detail]?
        
        enum CodingKeys: String, CodingKey {
            case breakingNews = "breakingNews"
            case topNews = "topNews"
            case dailyBriefings = "dailyBriefings"
            case technicalAnalysis = "technicalAnalysis"
            case specialReport = "specialReport"
            
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            breakingNews = try container.decodeIfPresent([detail].self, forKey: .breakingNews)
            topNews = try container.decodeIfPresent([detail].self, forKey: .topNews)
            technicalAnalysis = try container.decodeIfPresent([detail].self, forKey: .technicalAnalysis)
            //dailyBriefings = try container.decodeIfPresent([dailybriefing].self, forKey: .dailyBriefings)
            specialReport = try container.decodeIfPresent([detail].self, forKey: .specialReport)


        }
    }
    
    struct detail: Codable{
        var title: String?
        var url: String?
        var description: String?
        var content: String?
        var firstImageUrl: String?
        var headlineImageUrl: String?
        var articleImageUrl: String?
        var backgroundImageUrl: String?
        var videoType: String?
        var videoId:String?
        var videoUrl: String?
        var videoThumbnail: String?
        var newsKeywords: String?
        var authors: [author]?
        var instruments: [String]?
        var tags: [String]?
        var categories: [String]?
        var displayTimestamp: String?
        var lastUpdatedTimestamp: String?
        
        
        enum CodingKeys: String, CodingKey {
            case title = "title"
            case url = "url"
            case description = "description"
            case content = "content"
            
            case firstImageUrl = "firstImageUrl"
            case headlineImageUrl = "headlineImageUrl"
            case articleImageUrl = "articleImageUrl"
            case backgroundImageUrl = "backgroundImageUrl"
            
            case videoType = "videoType"
            case videoId = "videoId"
            case videoUrl = "videoUrl"
            case videoThumbnail = "videoThumbnail"
            
            case newsKeywords = "newsKeywords"
            case authors = "authors"
            case instruments = "instruments"
            case tags = "tags"
            
            case categories = "categories"
            //case displayTimestamp = "displayTimestamp"
            //case lastUpdatedTimestamp = "lastUpdatedTimestamp"
            
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)

            title = try container.decodeIfPresent(String.self, forKey: .title)
            url = try container.decodeIfPresent(String.self, forKey: .url)
            description = try container.decodeIfPresent(String.self, forKey: .description)
            content = try container.decodeIfPresent(String.self, forKey: .content)

            firstImageUrl = try container.decodeIfPresent(String.self, forKey: .firstImageUrl)
            headlineImageUrl = try container.decodeIfPresent(String.self, forKey: .headlineImageUrl)
            articleImageUrl = try container.decodeIfPresent(String.self, forKey: .articleImageUrl)
            backgroundImageUrl = try container.decodeIfPresent(String.self, forKey: .backgroundImageUrl)

            videoType = try container.decodeIfPresent(String.self, forKey: .videoType)
            videoId = try container.decodeIfPresent( String.self, forKey: .videoId)
            videoUrl = try container.decodeIfPresent(String.self, forKey: .videoUrl)
            videoThumbnail = try container.decodeIfPresent(String.self, forKey: .videoThumbnail)

            newsKeywords = try container.decodeIfPresent(String.self, forKey: .newsKeywords)
            authors = try container.decodeIfPresent([author].self, forKey: .authors)
            instruments = try container.decodeIfPresent([String].self, forKey: .instruments)
            tags = try container.decodeIfPresent([String].self, forKey: .tags)

            categories = try container.decodeIfPresent([String].self, forKey: .categories)
            //displayTimestamp = try container.decodeIfPresent(String.self, forKey: .displayTimestamp)
            //lastUpdatedTimestamp = try container.decodeIfPresent(String.self, forKey: .lastUpdatedTimestamp)


        }
        
    }
    
    struct author: Codable{
        var name: String?
        var title: String?
        var bio: String?
        var email: String?
        var phone: String?
        var facebook: String?
        var twitter: String?
        var googleplus: String?
        var subscription: String?
        var rss: String?
        var descriptionLong: String?
        var descriptionShort: String?
        var photo: String?
        
        enum CodingKeys: String, CodingKey {
            case name = "name"
            case title = "title"
            case bio = "bio"
            case email = "email"
            
            case phone = "phone"
            case facebook = "facebook"
            case twitter = "twitter"
            case googleplus = "googleplus"
            
            case subscription = "subscription"
            case rss = "rss"
            case descriptionLong = "descriptionLong"
            case descriptionShort = "descriptionShort"
            
            case photo = "photo"
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)

            name = try container.decodeIfPresent(String.self, forKey: .name)
            title = try container.decodeIfPresent(String.self, forKey: .title)
            bio = try container.decodeIfPresent(String.self, forKey: .bio)
            email = try container.decodeIfPresent(String.self, forKey: .email)

            phone = try container.decodeIfPresent(String.self, forKey: .phone)
            facebook = try container.decodeIfPresent(String.self, forKey: .facebook)
            twitter = try container.decodeIfPresent(String.self, forKey: .twitter)
            googleplus = try container.decodeIfPresent(String.self, forKey: .googleplus)

            subscription = try container.decodeIfPresent(String.self, forKey: .subscription)
            rss = try container.decodeIfPresent(String.self, forKey: .rss)
            descriptionLong = try container.decodeIfPresent(String.self, forKey: .descriptionLong)
            descriptionShort = try container.decodeIfPresent(String.self, forKey: .descriptionShort)

            photo = try container.decodeIfPresent(String.self, forKey: .photo)

        }
        
    }
    
    struct dailybriefing: Codable{
        var eu: [detail]?
        var asia: [detail]?
        var us: [detail]?
        
        enum CodingKeys: String, CodingKey {
            case eu = "eu"
            case asia = "asia"
            case us = "us"
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            eu = try container.decodeIfPresent([detail].self, forKey: .eu)
            asia = try container.decodeIfPresent([detail].self, forKey: .asia)
            us = try container.decodeIfPresent([detail].self, forKey: .us)
        }
    }


