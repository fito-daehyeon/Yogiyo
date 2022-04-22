//
//  RealmManager.swift
//  Coding-Test
//
//  Created by DaeHyeon Kim on 2022/04/22.
//  Copyright © 2022 DeliveyHero. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers
class JJIM: Object {
    dynamic var name : String = ""
    dynamic var jjimselect : Bool = false
    dynamic var joinPath: String = ""
}

enum JjimJoinPath: String {
    
    case jjim = "jjim"
}


class RealmManager {
    static let shared = RealmManager()
    
    private init() {
        let config = Realm.Configuration(
            schemaVersion: 1,
            migrationBlock: { migration, oldSchemaVersion in
                if (oldSchemaVersion < 1) {
                    // RecentAddresseModel 추가
                }
            })

        print("🤢 doc path : \(getDocumentsDirectory())")
        
        Realm.Configuration.defaultConfiguration = config
  
    }
    
    func getJJIMInfo() -> [JJIM] {
        let realm = try! Realm()
        let jjim = realm.objects(JJIM.self)
        return Array(jjim)
    }
    
    func createJJIMInfo(
        select : Bool,
        name : String,
        joinPath: JjimJoinPath
    ) {
        let realm = try! Realm()
        
        let jjim = JJIM()
        
        jjim.jjimselect = select
        jjim.name = name
        jjim.joinPath = joinPath.rawValue
        
        try! realm.write {
            realm.add(jjim)
        }
    }
    
    func removeUserInfo(name:String) {
        let realm = try! Realm()
        if let jjim = realm.objects(JJIM.self).filter(NSPredicate(format: "name = %@", name)).first {
            try! realm.write {
                realm.delete(jjim)
            }
            
        } else {
            
        }
    }
    
    
    private func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
}
