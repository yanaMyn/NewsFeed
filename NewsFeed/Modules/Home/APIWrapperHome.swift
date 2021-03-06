//
//  APIWrapperHome.swift
//  NewsFeed
//
//  Created by yana mulyana on 10/02/20.
//  Copyright © 2020 LinkAJa. All rights reserved.
//

import Foundation

public enum APIWrapperHome {
    case getList(page: String, querySearch: String)
}

extension APIWrapperHome: APIWrapper {
    public var baseUrl: String {
        return "https://api.nytimes.com/svc"
    }
    
    public var endPoint: String {
        return baseUrl + path
    }
    
    public var path: String {
        switch self {
        case .getList(let page, let querySearch):
            return "/search\(version)/articlesearch.json?api-key=\(apiKey)&q=\(querySearch)&page=\(page)"
        }
    }
    
    public var version: String {
        return "/v2"
    }
    
    public var method: HTTPMethod {
        return .get
    }
    
    public var parameters: Parameters? {
        return nil
    }
    
    public var headers: Headers? {
        return nil
    }
    
    public var encoding: JSONEncoding {
        return .default
    }
    
    
}
