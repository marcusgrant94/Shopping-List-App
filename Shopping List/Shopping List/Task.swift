//
//  Task.swift
//  Shopping List
//
//  Created by Marcus Grant on 3/25/22.
//

import Foundation
import RealmSwift

class Task: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title = ""
    @Persisted var completed = false
}

