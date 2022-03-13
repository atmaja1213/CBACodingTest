//
//  NewsFeedView.swift
//  CBAOnlineTest
//
//  Created by Sahoo, Atmaja(AWF)(eCG) on 11/03/22.
//

import UIKit

class NewsFeedView: UIView {
    let newsTableView = UITableView()
    let headerLabel = UILabel()

    func createUI() {
        headerLabel.frame =  CGRect(x: self.frame.width/2 - 60, y: 40, width: 120, height: 60)
        headerLabel.text = "Latest News"
        headerLabel.textColor = UIColor(red:0.25, green:0.72, blue:0.85, alpha:1.0)
        headerLabel.font = UIFont(name:"Helvetica Bold", size: 20.0)
        self.addSubview(headerLabel)
        self.backgroundColor = UIColor.white
        self.newsTableView.backgroundColor = UIColor.white
        self.newsTableView.separatorStyle = .none
        self.addSubview(self.newsTableView)
        
    }

}
