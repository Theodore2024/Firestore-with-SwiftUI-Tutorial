//
//  Memo.swift
//  wikiKitFirestore
//
//  Created by TEO on 4/30/24.
//

import Foundation


struct Memo : Hashable, Identifiable{
    var id : String
    var user : String
    var contents : String
}
