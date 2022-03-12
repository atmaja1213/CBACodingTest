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
        self.newsFeedView.newsTableView.translatesAutoresizingMaskIntoConstraints = false
        self.newsFeedView.newsTableView.topAnchor.constraint(equalTo: self.newsFeedView.headerLabel.bottomAnchor).isActive = true
        self.newsFeedView.newsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        self.newsFeedView.newsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        self.newsFeedView.newsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

        self.newsFeedView.newsTableView.delegate = self
        self.newsFeedView.newsTableView.dataSource = self
        self.newsFeedView.newsTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        self.newsFeedView.newsTableView.estimatedRowHeight = 100
        self.newsFeedView.newsTableView.rowHeight = UITableView.automaticDimension

    }

}
// MARK: - Table view delegate and datasource methods
extension ViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        100
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell

        cell.descriptionLabel.text = "Goldman Sachs and JPMorgan Chase are the first major Western banks to get out of Russia following the invasion of Ukraine. More are likely to follow at a cost of tens of billions of dollars.  Goldman Sachs and JPMorgan Chase are the first major Western banks to get out of Russia following the invasion of Ukraine. More are likely to follow at a cost of tens of billions of dollars."
        cell.titelLabel.text = "Russia owes Western banks $120 billion. They won't get it back - CNN"

                return cell
    }
    
    
}

