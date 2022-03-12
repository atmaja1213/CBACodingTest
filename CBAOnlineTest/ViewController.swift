//
//  ViewController.swift
//  CBAOnlineTest
//
//  Created by Sahoo, Atmaja(AWF)(eCG) on 11/03/22.
//

import UIKit

class ViewController: UIViewController {
    var articles = [Article]()
var newsFeedView = NewsFeedView()
    private let refreshControl = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidLayoutSubviews() {
        self.loadUI()
        self.getNewsData(completion: { [weak self] result in
            print(result)
            switch result {
            case.failure(let error):
                           print(error)
                       
                       
                       case .success(let news):
                        
                        self?.articles = news.articles
                        DispatchQueue.main.async{
                            self?.newsFeedView.newsTableView.reloadData()
                        }
                           
            }
           
        })
        
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
        // MARK: - Add refresh control to table view
        if #available(iOS 10.0, *) {
            self.newsFeedView.newsTableView.refreshControl = refreshControl
        } else {
            self.newsFeedView.newsTableView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(refreshWeatherData(_:)), for: .valueChanged)
        refreshControl.tintColor = UIColor(red:0.25, green:0.72, blue:0.85, alpha:1.0)
        refreshControl.attributedTitle = NSAttributedString(string: "Fetching latest news ...", attributes: nil)


    }
    @objc private func refreshWeatherData(_ sender: Any) {
        self.getNewsData(completion: { [weak self] result in
            print(result)
            switch result {
            case.failure(let error):
                           print(error)
                       
                       
                       case .success(let news):
                        
                        self?.articles = news.articles
                        DispatchQueue.main.async{
                            self?.newsFeedView.newsTableView.reloadData()
                            self?.refreshControl.endRefreshing()
                        }
                           
            }
           
        })
        
    }

    // MARK: - Call news api
    func getNewsData(completion: @escaping(Result<NewsDetails, Error>) -> Void) {
        
        let dataTask = URLSession.shared.dataTask(with: URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=05030e7af26c4f52b9cdcf04dadf5a30")!) { (data, response, error) in
            
            guard error == nil else {
                print (error!.localizedDescription)
                print ("stuck in data task")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let jsonData = try decoder.decode(NewsDetails.self, from: data!)
                completion(.success(jsonData))
            }
            catch {
                print ("an error in catch")
                print (error)
            }
            
            
        
        }
        dataTask.resume()
    }
 }



// MARK: - Table view delegate and datasource methods
extension ViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.articles.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        if let descriptionText = self.articles[indexPath.row].description, let titelText = self.articles[indexPath.row].title {
        cell.descriptionLabel.text = descriptionText
            cell.titelLabel.text = titelText
        } else {
            cell.titelLabel.text = "We are getting the news soon...We just need some more information to get the things ready and deliver an awesome news reading experience for you & keep you fully updated."
            cell.descriptionLabel.text = "We are getting the news soon..."
        }
        

                return cell
    }
    
    
}

