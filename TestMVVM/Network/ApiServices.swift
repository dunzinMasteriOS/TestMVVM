//
//  ApiServices.swift
//  TestMVVM
//
//  Created by Suraj_Mac on 12/13/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation
import Alamofire


extension Constant.Message {
    static let urlNotValid = "Url is not valid!"
    static let dataNotFound = "Data not Found!"
}

// For showing the API response
enum Result<T> {
    case Success(T)
    case Failure(String)
}

protocol ApiServiceProtocol {
    func fetchHomeItem(completion: @escaping (Result<[HomeViewPresentable]>) -> ())
}

class ApiServices: ApiServiceProtocol {
    
    func fetchHomeItem(completion: @escaping (Result<[HomeViewPresentable]>) -> ()) {
        guard let url = URL(string: Constant.API.companyURL) else {
            return completion(.Failure(Constant.Message.urlNotValid))
        }
        
        Alamofire.request(url).response { (response) in
            guard let data = response.data else {
                return completion(.Failure(Constant.Message.dataNotFound))
            }
            
            var homeList = [HomeViewPresentable]()
            
            if let homeData = try! JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                if let items = homeData[HomeApiConstant.results] as? NSArray{
                    items.forEach({ (item) in
                        if let item = item as? [String:Any]{
                            if let itemName = item[HomeApiConstant.name] as? String
                            ,let itemUrl = item[HomeApiConstant.url] as? String
                                ,let itemIcon = item[HomeApiConstant.icon] as? String {
                                let homeItem = HomeModel(name: itemName, url: itemUrl, icon: itemIcon)
                                homeList.append(homeItem)
                            }
                        }
                    })
                }
            }
            completion(.Success(homeList))
        }
    }
    
}

