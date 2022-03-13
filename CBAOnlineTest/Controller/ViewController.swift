//
//  ViewController.swift
//  CBAOnlineTest
//
//  Created by Sahoo, Atmaja(AWF)(eCG) on 11/03/22.
//

import UIKit

class ViewController: UIViewController {
    var articles = [Article]()
    var activityView:UIActivityIndicatorView?
    var newsFeedView = NewsFeedView()
    private let refreshControl = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewDidLayoutSubviews() {
        self.loadUI()
        self.callTheNewsDetailsApi()
        
    }
    func callTheNewsDetailsApi() {
        self.getNewsData(Constants.kNewsUrl, completion: { [weak self] result in
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
        DispatchQueue.main.async{
            if ((self.activityView) != nil) {
                self.activityView?.stopAnimating()
                self.activityView?.removeFromSuperview()
            }
        }
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
        refreshControl.attributedTitle = NSAttributedString(string: Constants.kFetchingNews, attributes: nil)
        
        
    }
    @objc private func refreshWeatherData(_ sender: Any) {
        self.callTheNewsDetailsApi()
        self.refreshControl.endRefreshing()
        
        
    }
    
    // MARK: - Call news api
    func getNewsData(_ url:String,completion: @escaping(Result<NewsDetails, Error>) -> Void) {
        self.activityView = UIActivityIndicatorView(style: .medium)
        activityView?.center = self.newsFeedView.center
        activityView?.tintColor = UIColor.blue
        activityView?.startAnimating()
        guard let activityIndicator = activityView else { return}
        self.newsFeedView.addSubview(activityIndicator)
        guard  let validUrl = URL(string: url) else {
            return
        }
        let dataTask = URLSession.shared.dataTask(with: validUrl) { (data, response, error) in
            
            guard error == nil else {
                print (error!.localizedDescription)
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let jsonData = try decoder.decode(NewsDetails.self, from: data!)
                completion(.success(jsonData))
            }
            catch {
                print (error)
            }
            
        }
        dataTask.resume()
    }
}



// MARK: - Table view delegate and datasource methods
extension ViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //self.articles.count
        20
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        //        if let descriptionText = self.articles[indexPath.row].description, let titelText = self.articles[indexPath.row].title {
        //        cell.descriptionLabel.text = descriptionText
        //            cell.titelLabel.text = titelText
        //            cell.snapView.loadImageCacheWithUrlString(urlString: "https://static.foxnews.com/foxnews.com/content/uploads/2022/03/Austin-plane1.jpeg")
        //        } else {
        cell.titelLabel.text = Constants.defaultTitelText
        cell.descriptionLabel.text = Constants.defaultDescriptionText
        cell.snapView.loadImageCacheWithUrlString(urlString: Constants.defaultImageURL)
        // }
        
        
        return cell
    }
    /*The api being used is not giving data in chuncks...so i am calling the same api when the table view is scrolled beyound the screen size. */
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if (offsetY > contentHeight - scrollView.frame.height * 4)  {
            // self.callTheNewsDetailsApi()
        }
    }
    
    
}

