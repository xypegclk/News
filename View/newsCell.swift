//
//  newsCell.swift
//  News
//
//  Created by 薛義郎 on 2020/3/24.
//  Copyright © 2020 薛義郎. All rights reserved.
//

import UIKit
import Kingfisher

class newsCell: UITableViewCell {

    @IBOutlet weak var newImage: UIImageView!
    @IBOutlet weak var newTitle: UILabel!
    @IBOutlet weak var newDescriptior: UILabel!
    
    var newViewModel: NewsViewModel! {
        didSet {
            self.newTitle.text = newViewModel.title
            self.newDescriptior.text = newViewModel.description
            self.newImage.kf.setImage(with: URL(string: newViewModel.urlToImage))
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
