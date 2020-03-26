//
//  newsVM.swift
//  News
//
//  Created by 薛義郎 on 2020/3/25.
//  Copyright © 2020 薛義郎. All rights reserved.
//

import Foundation

struct NewsViewModel {
    
    let author: String
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    //let content: String?
    
    init(article: Article) {
        
        self.author = article.author!
        self.title = article.title!
        self.description = article.description!
        self.url = article.url!
        self.urlToImage = article.urlToImage!
        self.publishedAt = article.publishedAt!
        //self.content = article.content!
        
    }
}
