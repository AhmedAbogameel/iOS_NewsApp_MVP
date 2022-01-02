//
//  presenter.swift
//  NewsApp
//
//  Created by Jemi on 01/01/2022.
//

import Foundation
import UIKit

protocol HomeView : AnyObject {
    func updateUI()
}

class HomePresenter {
    
    var view:HomeView?
    var model: HomeModel?
    
    init(view:HomeView) {
        self.view = view
        model = HomeModel(self)
    }
    
    var news:[NewsItem] = []
    
    init(view:HomeView, model:HomeModel){
        self.view = view
        self.model = model
    }
    
    func getNews() {
        self.model?.getNews()
    }
    
    func updateUI(news:[NewsItem]) {
        self.news = news
        view?.updateUI()
    }
    
}
