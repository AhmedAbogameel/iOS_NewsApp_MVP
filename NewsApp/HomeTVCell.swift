//
//  HomeTVCell.swift
//  NewsApp
//
//  Created by Jemi on 01/01/2022.
//

import UIKit

class HomeTVCell: UITableViewCell {

    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setCellData(_ item: NewsItem) {
        titleLabel.text = item.title
        subtitleLabel.text = item.description
        loadImage(imageURL: item.urlToImage!)
//        dateLabel.text = item.publishAt
    }
    
    func loadImage(imageURL:String) {
        DispatchQueue.global().async {
            do {
                let url = URL(string: imageURL)!
                let data = try Data(contentsOf: url)
                DispatchQueue.main.sync {
                    self.imageLabel.image = UIImage(data: data)
                }
            } catch {
                print("ERROR!")
            }
        }
    }

}
