//
//  CounterVC.swift
//  NewsApp
//
//  Created by Jemi on 01/01/2022.
//

import UIKit

class CounterVC: UIViewController {

//    lazy var presenter = CounterPresenter(with: self)
    
    @IBOutlet weak var counterLabel: UILabel!
    
    @IBAction func onPlus(_ sender: UIButton) {
        if(sender.restorationIdentifier == "plus"){
//            presenter.add()
        } else {
//            presenter.minus()
        }
    }
    

}

//extension CounterVC:CounterView {
//
//    func updateUI() {
//        counterLabel.text = presenter.counter.formatted()
//    }
//
//}
