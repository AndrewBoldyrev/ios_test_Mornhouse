//
//  Numbers.swift
//  ios_test_Mornhouse
//
//  Created by Andrew Boldyrev on 20.12.2022.
//

import Foundation
import RealmSwift

class NumbersModel : Object, Identifiable {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var number: Int
    @Persisted var detailText: String
    
    override class func primaryKey() -> String? {
        "id"
    }
    
}
