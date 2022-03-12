//
//  NewsDetails.swift
//  CBAOnlineTest
//
//  Created by Sahoo, Atmaja(AWF)(eCG) on 12/03/22.
//

import Foundation
struct NewsDetails:Codable {
    
    var articles :[Article]
}
struct Article:Codable {
    var title:String?
    var description:String?
    var urlToImage:String?
}
