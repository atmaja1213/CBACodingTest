//
//  CustomTableViewCell.swift
//  CBAOnlineTest
//
//  Created by Sahoo, Atmaja(AWF)(eCG) on 11/03/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    let containerView: UIView = {
            let v = UIView()
            v.translatesAutoresizingMaskIntoConstraints = false
            return v
        }()

        // the constraint we'll use for myView's height
    var myViewHeightConstraint: NSLayoutConstraint!
    let lineView = UIView()
    let descriptionLabel = UILabel()
    let titelLabel = UILabel()
    let snapView = LazyImage()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
//        self.backgroundColor = UIColor.clear
//        self.addSubview(containerView)
//
//                // constrain it to all 4 sides
//        containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
//        containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
//        containerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
//        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//        containerView.backgroundColor = UIColor.cyan
//                // create the height constraint
//                myViewHeightConstraint = containerView.heightAnchor.constraint(equalToConstant: 1)
//
//                // needs Priority less-than 1000 (default) to avoid breaking constraints
//                myViewHeightConstraint.priority = UILayoutPriority.init(999)
//
//                // activate it
//                myViewHeightConstraint.isActive = true
//        self.snapView.frame = CGRect(x: self.frame.width - 75 , y: 0, width: 70, height: 70)
//        self.snapView.backgroundColor = UIColor.orange
////        self.addSubview(self.snapView)
////
////        self.titelLabel.frame = CGRect(x: (self.frame.width/2 - 170), y: 18, width: 280, height: 40)
////        self.titelLabel.text = "Russia owes Western banks $120 billion. They won't get it back - CNN"
////        self.titelLabel.font  = UIFont(name:"Helvetica Bold", size: 16.0)
////        self.titelLabel.lineBreakMode = .byWordWrapping
////        self.titelLabel.numberOfLines = 0
////        self.containerView.addSubview(self.titelLabel)
////
////        self.descriptionLabel.frame = CGRect(x: 5, y: 70, width: self.containerView.frame.width - 5, height: 120)
////        self.descriptionLabel.text = "Goldman Sachs and JPMorgan Chase are the first major Western banks to get out of Russia following the invasion of Ukraine. More are likely to follow at a cost of tens of billions of dollars."
////        self.descriptionLabel.backgroundColor = UIColor.green
////        self.descriptionLabel.font  = UIFont(name:"Helvetica Neue", size: 15.0)
////        self.descriptionLabel.lineBreakMode = .byWordWrapping
////        self.descriptionLabel.numberOfLines = 0
////       // self.containerView.addSubview(self.descriptionLabel)
        
        let marginGuide = contentView.layoutMarginsGuide
        // configure titleLabel
        contentView.addSubview(titelLabel)
        titelLabel.translatesAutoresizingMaskIntoConstraints = false
        titelLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        titelLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        titelLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor, constant: -85).isActive = true
        titelLabel.numberOfLines = 0
        
        
        
        
        contentView.addSubview(snapView)
        snapView.translatesAutoresizingMaskIntoConstraints = false
        snapView.leadingAnchor.constraint(equalTo: marginGuide.trailingAnchor, constant: -85).isActive = true
        snapView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        snapView.widthAnchor.constraint(equalToConstant: 70).isActive = true
//        snapView.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        snapView.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        snapView.backgroundColor = UIColor.systemPink
        
        contentView.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: titelLabel.bottomAnchor,constant: 20).isActive = true
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont(name: "Avenir-Book", size: 12)
        descriptionLabel.textColor = UIColor.red
        
        contentView.addSubview(lineView)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 7).isActive = true
        lineView.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        lineView.topAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        lineView.backgroundColor = UIColor.red
        

        
    }

}
