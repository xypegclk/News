//
//  News.swift
//  News
//
//  Created by 薛義郎 on 2020/3/24.
//  Copyright © 2020 薛義郎. All rights reserved.
//

import Foundation

struct New: Codable {
    
    var status: String = ""
    var totalResults: Int = 0
    var articles: [Article]?
    
}

struct Article: Codable {
    
    var author: String?
    var title: String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
    
}

struct NewDataStore: Codable {
    var articles: [Article]
}
