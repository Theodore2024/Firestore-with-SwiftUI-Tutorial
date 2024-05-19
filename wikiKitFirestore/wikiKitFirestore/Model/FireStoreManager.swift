//
//  FireStoreManager.swift
//  wikiKitFirestore
//
//  Created by TEO on 4/30/24.
//


import Foundation
import Firebase



protocol MemoDataStore {
    func fetchMemos()
    func updateMemo(_ memo: Memo)
    func addMemo(_ memo: Memo)
    func removeMemo(_ memo: Memo)
}


@Observable
class FireStoreManager {
    
    var memos : [Memo] = []
    
    let database = Firestore.firestore()
    
}


extension FireStoreManager: MemoDataStore {

    func fetchMemos() {
            database.collection("Memos")
                .getDocuments { (snapshot, error) in
                    self.memos.removeAll()
                    
                    if let snapshot {
                        for document in snapshot.documents {
                            let id: String = document.documentID
                            
                            let docData = document.data()
                            let user: String = docData["user"] as? String ?? ""
                            let contents: String = docData["contents"] as? String ?? ""

                            
                            let memo : Memo = Memo(id: id, user: user, contents: contents)
                            
                            self.memos.append(memo)
                        }
                    }
                }
        }
        
        func updateMemo(_ memo: Memo) {
            
            database.collection("Memos")
                .document(memo.id)
                .updateData(["user":memo.user, "contents":memo.contents])
            
            fetchMemos()
            
        }
        
        
        func addMemo(_ memo: Memo) {
            database.collection("Memos")
                .document(memo.id)
                .setData(["user": memo.user,
                          "contents": memo.contents])
            
            fetchMemos()
        }
        
                          
        func removeMemo(_ memo: Memo) {
            database.collection("Memos")
                .document(memo.id).delete()
            fetchMemos()
        }


}

