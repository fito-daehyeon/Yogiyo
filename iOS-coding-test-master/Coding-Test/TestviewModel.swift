//
//  TestviewModel.swift
//  Coding-Test
//
//  Created by DaeHyeon Kim on 2022/04/22.
//  Copyright © 2022 DeliveyHero. All rights reserved.
//

import Foundation
import Combine
import RealmSwift
import UIKit


enum urlsetver: String {
    case url1 = "https://beomcheol.github.io/ios-codding-test-resources/restaurants/1/restaurant.json"
    case url2 = "https://beomcheol.github.io/ios-codding-test-resources/restaurants/2/restaurant.json"
    case url3 = "https://beomcheol.github.io/ios-codding-test-resources/restaurants/3/restaurant.json"
}

class TestviewModel : ObservableObject
{
   
    @Published var foodlist = [ListResponse]()
    @Published var sectionTitle = [String]()
    private var disposables = Set<AnyCancellable>()
    
    var url = urlsetver.url3.rawValue
    func handleList()
    {
        APIFetcher.shared.requestList(url: url)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let Err):
                    switch Err {

                    case .emptyResponse:
                      print("빈 데이터")

                    default: break
                    }

                case .finished:
                    break
                }
            }, receiveValue: { [weak self] result in
                
                self?.foodlist = result
                
                
                //중복 제거
                for x in result
                {
                    self?.sectionTitle.append(x.sectionTitle)
                }
                let set = Set(self!.sectionTitle)
                self?.sectionTitle = Array(set.sorted(by: >))
                
             
            })
            .store(in: &disposables)
    }
    func handleJJIM()
    {
        sectionTitle = []
        APIFetcher.shared.requestList(url: url)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let Err):
                    switch Err {

                    case .emptyResponse:
                      print("빈 데이터")

                    default: break
                    }

                case .finished:
                    break
                }
            }, receiveValue: { [weak self] result in
                
                self?.foodlist = result
                
                
                //중복 제거
                for x in result
                {
                    if x.jjim == true
                    {
                        self?.sectionTitle.append(x.sectionTitle)
                    }
                   
                }
                let set = Set(self!.sectionTitle)
                self?.sectionTitle = Array(set.sorted(by: >))
                
                
             
            })
            .store(in: &disposables)
    }
    
    func handleencoded(urlString: String) -> URL{
     
        let encoded = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        return URL(string: encoded)!
        

    }
}

