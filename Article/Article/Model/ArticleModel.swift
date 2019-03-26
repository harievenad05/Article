//
//  ArticleModel.swift
//  Article
//
//  Created by WYNOT-MAC on 26/03/19.
//  Copyright © 2019 WYNOT-MAC. All rights reserved.
//

import Foundation
import UIKit
import ObjectMapper

class ArticleModel: NSObject, Mappable {
    
    var url: String?
    var title: String?
    var abstract: String?
    var section: String?
    var author: String?
    var date: String?
    var type: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        url <- map["url"]
        title <- map["title"]
        abstract <- map["abstract"]
        section <- map["section"]
        author <- map["byline"]
        date <- map["published_date"]
        type <- map["type"]
    }
    
    
}
