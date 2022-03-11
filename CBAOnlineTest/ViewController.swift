//
//  ViewController.swift
//  CBAOnlineTest
//
//  Created by Sahoo, Atmaja(AWF)(eCG) on 11/03/22.
//

import UIKit

class ViewController: UIViewController {
var newsFeedView = NewsFeedView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidLayoutSubviews() {
        self.loadUI()
    }
    func loadUI() {
        self.newsFeedView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.view.addSubview(self.newsFeedView)
        self.newsFeedView.createUI()
    }

}

