//
//  NewsEndPoint.swift
//  MVVM_News_App
//
//  Created by Davin Yulion on 27/10/21.
//

import Foundation

protocol APIBuilder {
    var urlRequest: URLRequest {get}
    var baseUrl: URL {get}
    var path: String {get}
}

enum NewsAPI {
    case getNews
}

extension NewsAPI: APIBuilder{
    
    var urlRequest: URLRequest{
        return URLRequest(url:  self.baseUrl.appendingPathComponent((self.path)))
    }
    
    var baseUrl: URL {
        switch self {
            case .getNews:
                return URL(string: "https://api.lil.software")!
        }
    }
    
    var path: String {
            return "/news"
    }
    
    
}
