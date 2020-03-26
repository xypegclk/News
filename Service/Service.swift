//
//  Service.swift
//  News
//
//  Created by 薛義郎 on 2020/3/25.
//  Copyright © 2020 薛義郎. All rights reserved.
//

import Foundation

class Service: NSObject {
    
    static let share = Service()
    
    func fetchNews(completion: @escaping([Article]?, Error?) -> ()) {
        
        var articles = [Article]()
        
        let urlString = "https://newsapi.org/v2/top-headlines?country=tw&apiKey=d2c5d74e66b54bb9aa5a0f078b6e4c09"
        guard let url = URL(string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, respone, error) in
            if let error = error {
                completion(nil, error)
                print("Failed to fetch news", error)
                return
            }
            
            guard let data = data else {return}
            do {
                let newDataStroe = try JSONDecoder().decode(NewDataStore.self, from: data)
                articles = newDataStroe.articles
                print(newDataStroe)
                DispatchQueue.main.async {
                    completion(articles, nil)
                }
                
            }catch let jsonError {
                print("Failed to fetch", jsonError)
            }
        }.resume()
    }
    
}
