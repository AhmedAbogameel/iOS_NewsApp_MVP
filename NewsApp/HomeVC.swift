//
//  ViewController.swift
//  NewsApp
//
//  Created by Jemi on 01/01/2022.
//

import UIKit

class HomeVC: UIViewController {
    
    lazy var presenter = HomePresenter(view: self)
    
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    @IBOutlet weak var newsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTableView.dataSource = self
        self.presenter.getNews()
    }

}

// ===== HomePresenter =====

extension HomeVC : HomeView {
        
    func updateUI() {
        DispatchQueue.main.async {
            self.newsTableView.isHidden = false
            self.loader.stopAnimating()
            self.newsTableView.reloadData()
        }
    }
    
}


// ===== HomeTV =====

extension HomeVC : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeTVCell", for: indexPath) as! HomeTVCell
        cell.setCellData(presenter.news[indexPath.row])
        return cell
    }
    
    
}

