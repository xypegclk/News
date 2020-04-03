//
//  ViewController.swift
//  News
//
//  Created by 薛義郎 on 2020/3/24.
//  Copyright © 2020 薛義郎. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var newViewModels = [NewsViewModel]()

    @IBOutlet weak var tableview: UITableView!
    
    var row: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchData()
    }

    func fetchData() {
        Service.share.fetchNews { (news, error) in
            if let error = error {
                print("Failed to fetch", error)
                return
            }
            
            self.newViewModels = news?.map({return NewsViewModel.init(article: $0)}) ?? []
            self.tableview.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "site" {
            if let articleSiteVC = segue.destination as? articleSiteViewController {
                if let indexPath = tableview.indexPathForSelectedRow{
                    articleSiteVC.url = newViewModels[indexPath.row].url
                }
            }
        }
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newCell", for: indexPath) as! newsCell
        
        let newViewModel = newViewModels[indexPath.row]
        cell.newViewModel = newViewModel
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //self.performSegue(withIdentifier: "site", sender: indexPath)
    }
    
}

