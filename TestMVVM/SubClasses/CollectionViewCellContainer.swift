//
//  CollectionViewCellContainer.swift
//  TestMVVM
//
//  Created by Suraj_Mac on 12/13/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class CollectionViewCellContainer: UIView {

    override func layoutSubviews() {
        super.layoutSubviews()
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 0.2
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }

}
