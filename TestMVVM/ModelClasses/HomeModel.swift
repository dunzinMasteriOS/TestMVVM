//
//  HomeModel.swift
//  TestMVVM
//
//  Created by Suraj_Mac on 12/13/18.
//  Copyright © 2018 mac. All rights reserved.
//

struct HomeApiConstant {
    static let results = "results"
    static let name = "artistName"
    static let url = "artistViewUrl"
    static let icon = "artworkUrl60"
}

protocol HomeViewPresentable {
    var name : String? {get}
    var url : String? {get}
    var icon : String? {get}
}

class HomeModel: HomeViewPresentable {
    var name: String?
    var url: String?
    var icon: String?
    
    init(name: String, url: String, icon: String) {
        self.name = name
        self.url = url
        self.icon = icon
    }
}
