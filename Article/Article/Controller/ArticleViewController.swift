//
//  ArticleViewController.swift
//  Article
//
//  Created by WYNOT-MAC on 26/03/19.
//  Copyright © 2019 WYNOT-MAC. All rights reserved.
//

import UIKit
import WebKit

class ArticleViewController: UIViewController, WKUIDelegate {
    
    @IBOutlet weak var headingTxtLbl: UILabel!
    @IBOutlet weak var titleTxtLbl: UILabel!
    @IBOutlet weak var authorTxtLbl: UILabel!
    @IBOutlet weak var readmoreBtn: UIButton!
    @IBOutlet weak var dateTxtLbl: UILabel!
    @IBOutlet weak var abstractTxtView: UITextView!
    
    var heading = "NY Times Article"
    var titleTxt: String?
    var authorTxt: String?
    var articleUrl: String?
    var dateTxt: String?
    var abstractTxt: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        self.headingTxtLbl.text = heading
        self.titleTxtLbl.text = titleTxt
        self.authorTxtLbl.text = authorTxt
        self.dateTxtLbl.text = dateTxt
        self.abstractTxtView.text = abstractTxt
        self.readmoreBtn.addTarget(self, action: #selector(readmoreTapped), for: UIControl.Event.touchUpInside)
    }
    
    @objc func readmoreTapped() {
        let urlPrivacyPolicy = URL(string:"\(articleUrl ?? "")")
        UIApplication.shared.open(urlPrivacyPolicy!, options: [:], completionHandler: nil)
    }
    
    @IBAction func backBtnTapped(_ sender: Any) {
       self.dismiss(animated: true, completion: nil)
    }
    
}
