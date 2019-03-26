//
//  ArticleCell.swift
//  Article
//
//  Created by WYNOT-MAC on 26/03/19.
//  Copyright © 2019 WYNOT-MAC. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {
    @IBOutlet weak var initialTxtLbl: UILabel!
    @IBOutlet weak var headingTxtLbl: UILabel!
    @IBOutlet weak var authorTxtLbl: UILabel!
    @IBOutlet weak var dateTxtLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialTxtLbl.layer.cornerRadius = 30
        initialTxtLbl.layer.masksToBounds = true
    }
    
    func updateCells(articleMdl: ArticleModel) {
        let type = articleMdl.type
        let typeFirstThree = type?[..<3].uppercased()
        initialTxtLbl.text = "\(typeFirstThree ?? "")"
        headingTxtLbl.text = articleMdl.title
        authorTxtLbl.text = articleMdl.author
        dateTxtLbl.text = articleMdl.date
    }

}
