//
//  HomeViewViewModel.swift
//  TestMVVM
//
//  Created by Suraj_Mac on 12/13/18.
//  Copyright © 2018 mac. All rights reserved.
//

import Foundation

class HomeViewViewModel {
    
    var homeItemList = [HomeViewPresentable]()
    
    var selectedItem : HomeViewPresentable?
    
    var apiService: ApiServiceProtocol
    
    //Dependency Injection
    init(apiService: ApiServiceProtocol = ApiServices()) {
        self.apiService = apiService
    }
    
    func loadItems(completion:@escaping(Bool, String) -> ()) {
        apiService.fetchHomeItem { (result) in
            switch result {
            case .Success(let homeList):
                self.homeItemList = homeList
                completion(true, "")
            case .Failure(let message):
                completion(false, message)
            }
        }
    }
    
    func userPressed(at indexPath:IndexPath) {
        selectedItem = homeItemList[indexPath.row]
    }
}
extension HomeViewViewModel{
    
    func numberOfRowsForSection(_ section: Int) -> Int {
        return section == 0 ? homeItemList.count : 0
    }
    
    func cellForRowAtIndexPath(_ indexPath: IndexPath) -> HomeViewPresentable {
        return homeItemList[indexPath.row]
    }
}
