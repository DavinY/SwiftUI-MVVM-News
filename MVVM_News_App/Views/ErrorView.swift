//
//  ErrorView.swift
//  MVVM_News_App
//
//  Created by Davin Yulion on 27/10/21.
//

import SwiftUI

struct ErrorView: View {
    typealias ErrorViewActionHanlder = () -> Void
    
    let error: Error
    let handler: ErrorViewActionHanlder

    internal init(error: Error, handler: @escaping ErrorView.ErrorViewActionHanlder) {
        self.error = error
        self.handler = handler
    }
    
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.icloud.fill")
                .foregroundColor(.gray)
                .font(.system(size: 50, weight: .heavy))
                .padding(.bottom, 4)
            Text("Ooopss!!")
                .foregroundColor(.black)
                .font(.system(size: 30, weight: .heavy))
            Text(error.localizedDescription)
                .foregroundColor(.gray)
                .font(.system(size: 15))
                .multilineTextAlignment(.center)
                .padding(.vertical, 4)
            Button(action: {
                // we need to perform and action
                handler()
            }, label: {
                Text("Retri")
            })
            .padding(.vertical, 12)
            .padding(.horizontal, 30)
            .background(Color.blue)
            .foregroundColor(.white)
            .font(.system(size: 15, weight: .heavy))
            .cornerRadius(10)
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: APIError.decodingError) {}
            .previewLayout(.sizeThatFits)
    }
}
