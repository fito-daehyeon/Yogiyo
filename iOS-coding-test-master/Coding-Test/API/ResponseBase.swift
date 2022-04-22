//
//  ResponseBase.swift
//  Coding-Test
//
//  Created by DaeHyeon Kim on 2022/04/22.
//  Copyright © 2022 DeliveyHero. All rights reserved.
//

import Foundation


struct ResponseBase<T: Codable>: Codable {
     let resultData: T?
//
//    enum CodingKeys: String, CodingKey {
//        case resultData = "data"
//    }
//
//    init(from decoder: Decoder) throws {
//        let values = try decoder.container(keyedBy: CodingKeys.self)
//
//        self.resultData = try? values.decode(T.self, forKey: .resultData)
//    }
}




struct ListResponse : Codable,Identifiable
{
    let id = UUID()
    var isAvailablePickup : Bool
    var logoUrl : String
    var name : String
    var deliveryMethod : String
    var isPhoneOrderAvailable : Bool
    var reviewCount : Int
    var ownerReplyCount : Int
    var sectionTitle : String
    var reviewAvg : Float
    var payment : [String]
    var jjim : Bool?
    
    
    enum CodingKeys: String, CodingKey {
        case isAvailablePickup
        case logoUrl
        case name
        case deliveryMethod
        case isPhoneOrderAvailable
        case reviewCount
        case ownerReplyCount
        case sectionTitle
        case reviewAvg
        case payment
        case jjim
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        isAvailablePickup = try values.decode(Bool.self, forKey: .isAvailablePickup)
        logoUrl = try values.decode(String.self, forKey: .logoUrl)
        name = try values.decode(String.self, forKey: .name)
        deliveryMethod = try values.decode(String.self, forKey: .deliveryMethod)
        isPhoneOrderAvailable = try values.decode(Bool.self, forKey: .isPhoneOrderAvailable)
        reviewCount = try values.decode(Int.self, forKey: .reviewCount)
        ownerReplyCount = try values.decode(Int.self, forKey: .ownerReplyCount)
        sectionTitle = try values.decode(String.self, forKey: .sectionTitle)
        reviewAvg = try values.decode(Float.self, forKey: .reviewAvg)
        payment = try values.decode([String].self, forKey: .payment)
        
        if let jjimselect = try? values.decode(Bool.self, forKey: .jjim)
        {
            jjim = jjimselect
        }
        else
        {
            for x in RealmManager.shared.getJJIMInfo()
            {
                if name == x.name
                {
                    jjim = true
                    break
                }
                else
                {
                    jjim = false
                }
                    
            }
        }
       
        
    }
}
