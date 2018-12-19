//
//  HomeTableViewCell.swift
//  TestMVVM
//
//  Created by Suraj_Mac on 12/13/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit
import SDWebImage

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    var home: HomeViewPresentable! {
        didSet {
            self.itemNameLabel.text = home.name
            self.itemImageView.image = UIImage(named: "placeholder")
            if let iconPath = home.icon, let iconUrl = URL(string: iconPath) {
                self.itemImageView.sd_setImage(with: iconUrl, placeholderImage: UIImage(named: "placeholder"))
            }
        }
    }
    
}
