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

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "newCell", for: indexPath) as! newsCell
        
        let newViewModel = newViewModels[indexPath.row]
        cell.newViewModel = newViewModel
        
        return cell
    }
}

