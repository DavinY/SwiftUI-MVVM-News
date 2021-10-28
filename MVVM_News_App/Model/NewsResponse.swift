//
//  NewsResponse.swift
//  MVVM_News_App
//
//  Created by Davin Yulion on 27/10/21.
//

import Foundation


// MARK: - Welcome
struct NewsResponse: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable, Identifiable {
    let id = UUID()
    let author: String?
    let url: String?
    let source, title, articleDescription: String?
    let image: String?
    let date: Date?

    enum CodingKeys: String, CodingKey {
        case author, url, source, title
        case articleDescription = "description"
        case image, date
    }
}


extension Article {
    static var dummyData: Article {
        .init(
            author: "Morgan McFall-Johnsen",
            url: "https://www.businessinsider.com/spacex-discovers-urine-leak-on-crew-dragon-spaceships-2021-10",
            source: "Business Insider",
            title: "A toilet tube on SpaceX's Crew Dragon spaceship broke and sprayed pee under the floor during its first tourist flight - Yahoo News",
            articleDescription: "SpaceX's passengers were safe from their own urine, since it never entered the cabin. But astronauts discovered the same issue on another Crew Dragon.",
            image: "https://i.insider.com/61789ba9e100ad00181dd98b?width=1200&format=jpeg", date: Date())
    }
}
