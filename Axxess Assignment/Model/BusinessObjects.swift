//
//  BusinessObjects.swift
//  Axxess Assignment//  Axxess Assignment
//
//  Created by Badve, Akshay on 7/18/20.
//  Copyright © 2020 Badve, Akshay. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class ListObject: Object {
    
    @objc dynamic var id: String = Constants.Strings.emptyString
    @objc dynamic var type: String = Constants.Strings.emptyString
    @objc dynamic var date: String = Constants.Strings.emptyString
    @objc dynamic var data: String = Constants.Strings.emptyString
    
    override class func primaryKey() -> String? {
        return Constants.RealmConstants.id
    }
}
