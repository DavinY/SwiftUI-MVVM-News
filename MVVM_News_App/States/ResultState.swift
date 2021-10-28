//
//  ResultState.swift
//  MVVM_News_App
//
//  Created by Davin Yulion on 27/10/21.
//

import Foundation

enum ResultState{
    case loading
    case success(content: [Article])
    case failed(error : Error)
}
