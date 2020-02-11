//
//  HomeInteractor.swift
//  NewsFeed
//
//  Created yana mulyana on 10/02/20.
//  Copyright © 2020 LinkAJa. All rights reserved.
//
//  Template generated by Yana Mulyana
//

import UIKit

class HomeInteractor: HomePresenterToInteractorProtocol {

    var presenter: HomeInteractorToPresenterProtocol?
    
    lazy var service: APINetwork = {
       let configuration = URLSessionConfiguration.default
       configuration.timeoutIntervalForRequest = 40
       configuration.timeoutIntervalForResource = 40

        let newSession = APINetwork(configuration: configuration)
        return newSession
    }()
    
    func fetchData() {
        self.service.performRequest(apiNetwork: APIWrapperHome.getList(page: "0", querySearch: "Indonesia")) { (result) in
            switch result {
            case .success(let data, let urlResponse):
                
            guard let object = data.decode(modelType: Feed.self, data: data) as? Feed, urlResponse?.statusCode == 200 else { return }
            self.presenter?.dataFetched(object: object)
                
            case .failure(let error):
                self.presenter?.dataFetchedFailed(errorName: error.localizedDescription)
            }
        }
    }
}
