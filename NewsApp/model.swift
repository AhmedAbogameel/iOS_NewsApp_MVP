//
//  model.swift
//  NewsApp
//
//  Created by Jemi on 01/01/2022.
//

import Foundation

class HomeModel {
        
    var presenter: HomePresenter
    
    init(_ presenter:HomePresenter){
        self.presenter = presenter
    }
    
    func getNews() {
        if let url = URL(string: "https://newsapi.org/v2/everything?q=apple&from=2021-12-31&to=2021-12-31&sortBy=popularity&apiKey=df1a070b89e64ce78ba286cea86af31b") {
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if error != nil {
                    print("Error")
                    return
                }
                
                if let safeData = data {
                    let news = self.parseJSON(safeData)?.articles ?? []
                    self.presenter.updateUI(news: news)
                }
            }
            
            task.resume()
        }
    }
    
    func parseJSON(_ data: Data) -> News? {
            
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(News.self, from: data)
                return decodedData
            } catch {
                return nil
            }
        }
    
}
