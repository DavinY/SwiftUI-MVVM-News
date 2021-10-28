//
//  NewsViewModel.swift
//  MVVM_News_App
//
//  Created by Davin Yulion on 27/10/21.
//

import Foundation
import Combine

protocol NewsViewModel {
    func getArticles()
}


class NewsViewModelImpl: ObservableObject, NewsViewModel{
    private let service: NewsService;
    
    // Variable with Setter and Getter
    private(set) var article = [Article]()
    private var cancellabels = Set<AnyCancellable>()
    
    @Published private(set) var state: ResultState = .loading
    
    init(service: NewsService){
        self.service = service
    }
    func getArticles() {
        self.state = .loading
        
        let cancellable = service
            .request(from: .getNews)
            .sink{ res in
                switch res{
                    case .finished:
                        self.state = .success(content: self.article)
                    case .failure(let error):
                        self.state = .failed(error: error)
                }
            } receiveValue: { response in
                self.article = response.articles
            }

        self.cancellabels.insert(cancellable)
    }
}
