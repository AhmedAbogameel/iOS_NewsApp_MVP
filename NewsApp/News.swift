//
//  News.swift
//  NewsApp
//
//  Created by Jemi on 01/01/2022.
//

import Foundation

struct News : Codable {
    
    var articles:[NewsItem]?
    
}

struct NewsItem : Codable {
    var title:String?
    var author:String?
    var urlToImage:String?
    var description:String?
    var content:String?
    var publishAt:String?
}
