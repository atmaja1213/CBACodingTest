//
//  CustomTableViewCell.swift
//  CBAOnlineTest
//
//  Created by Sahoo, Atmaja(AWF)(eCG) on 11/03/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    let containerView: UIView = {
            let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()

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
        let marginGuide = contentView.layoutMarginsGuide
        // configure titleLabel
        contentView.addSubview(titelLabel)
        titelLabel.translatesAutoresizingMaskIntoConstraints = false
        titelLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        titelLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        titelLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor, constant: -85).isActive = true
        titelLabel.numberOfLines = 0
        titelLabel.font = UIFont(name: "Helvetica Bold", size: 15)
        titelLabel.textColor = UIColor.black
        
        // add image view
        contentView.addSubview(snapView)
        snapView.translatesAutoresizingMaskIntoConstraints = false
        snapView.leadingAnchor.constraint(equalTo: marginGuide.trailingAnchor, constant: -85).isActive = true
        snapView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        snapView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        snapView.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        snapView.backgroundColor = UIColor.systemPink
        //Add description label
        contentView.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: titelLabel.bottomAnchor,constant: 20).isActive = true
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont(name: "Helvetica Neune", size: 10)
        descriptionLabel.textColor = UIColor.black
        //Add separator
        contentView.addSubview(lineView)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 7).isActive = true
        lineView.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
        lineView.topAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true
        lineView.backgroundColor = UIColor(red:0.25, green:0.72, blue:0.85, alpha:1.0)
        
    }

}
