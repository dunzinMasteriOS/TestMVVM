//
//  AppConstant.swift
//  TestMVVM
//
//  Created by Suraj_Mac on 12/13/18.
//  Copyright © 2018 mac. All rights reserved.
//

struct Constant {
    
    static let schemeUrl = "TestMVVM"
    
    struct API {
        static let baseUrl = ""
        static let companyURL = "https://itunes.apple.com/lookup?id=909253&entity=album"
    }
    
    struct Segue {
        static let category = "Category"
        static let product = "Product"
    }
    
    struct Message {
        static let alert = "Alert!"
        static let actionSheetTitle = "Choose Your preference!"
        static let takePhoto = "Take Photo"
        static let galleryChoose = "Choose from gallery"
        static let cancel = "Cancel"
    }
}
