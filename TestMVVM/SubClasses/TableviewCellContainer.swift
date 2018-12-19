//
//  TableviewCellContainer.swift
//  TestMVVM
//
//  Created by Suraj_Mac on 12/13/18.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class TableviewCellContainer: UIView {
    
    override func draw(_ rect: CGRect) {
        self.layer.shadowRadius = 1
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowOpacity = 0.5
        self.layer.cornerRadius = 5
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
    }
    
}
