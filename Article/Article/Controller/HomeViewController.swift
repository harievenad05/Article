//
//  HomeViewController.swift
//  Article
//
//  Created by WYNOT-MAC on 26/03/19.
//  Copyright © 2019 WYNOT-MAC. All rights reserved.
//

import UIKit
import MBProgressHUD
import Alamofire
import ObjectMapper

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var articleDatas = [ArticleModel]()
    var filteredArticleDatas = [ArticleModel]()
    
    @IBOutlet weak var articleTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadDataFromApi()
    }
    
    func setup() {
        self.articleTableView.delegate = self
        self.articleTableView.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredArticleDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell") as? ArticleCell {
            let articleMdl = filteredArticleDatas[indexPath.row]
            cell.updateCells(articleMdl: articleMdl)
            return cell
        }
        
        return ArticleCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let articleMdl = filteredArticleDatas[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let articleVC =  storyboard.instantiateViewController(withIdentifier: "ArticleViewController") as! ArticleViewController
        articleVC.titleTxt = articleMdl.title
        articleVC.authorTxt = articleMdl.author
        articleVC.articleUrl = articleMdl.url
        articleVC.dateTxt = articleMdl.date
        articleVC.abstractTxt = articleMdl.abstract
        self.present(articleVC, animated: true, completion: nil)
    }
    
    func loadDataFromApi() {
        let apiKey = "mfqZd9tPoWJGhHwvcjWDNGsHSmjOaagD"
        let url2 = "\(BASE_URL)\(apiKey)"
        articleDatas = []
        MBProgressHUD.showAdded(to: self.view, animated: true)
        Alamofire.request(url2, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { response in
            print(response)
            switch response.result {
            case .success:
                MBProgressHUD.hide(for: self.view, animated:true)
                if let responseJson = response.result.value as? NSDictionary {
                    if let articleDetailJson = responseJson["results"] as? [[String: Any]] {
                        for i in 0..<articleDetailJson.count {
                            print(articleDetailJson[i])
                            print("Printing..")
                            let articleMdl = Mapper<ArticleModel>().map(JSONObject: articleDetailJson[i])
                            self.articleDatas.append(articleMdl!)
                        }
                        self.filteredArticleDatas = self.articleDatas
                        self.articleTableView.reloadData()
                    }
                }
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
            
        }
        
        
    }


}
