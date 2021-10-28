//
//  ArticleView.swift
//  MVVM_News_App
//
//  Created by Davin Yulion on 27/10/21.
//

import SwiftUI
import URLImage

struct ArticleView: View {
    let article: Article
    var body: some View {
        HStack {
            if let imgUrl = article.image,
               let url = URL(string: imgUrl){
                URLImage(url,
                         failure: { error, _ in
                            PlaceHolderImageView()
                         },
                         content: {image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                         })
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                
            }
            else {
                PlaceHolderImageView()
            }
            
            VStack(alignment: .leading, spacing: 4, content: {
                Text(article.title ?? "")
                    .foregroundColor(.black)
                    .font(.system(size: 18, weight: .semibold))
                Text(article.source ?? "N/A")
                    .foregroundColor(.gray)
                    .font(.system(size: 18, weight: .semibold))
            })
        }
    }
}

struct PlaceHolderImageView: View {
    var body: some View {
        Image(systemName: "photo.fill")
            .foregroundColor(.white)
            .background(Color.gray)
            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article.dummyData)
    }
}
