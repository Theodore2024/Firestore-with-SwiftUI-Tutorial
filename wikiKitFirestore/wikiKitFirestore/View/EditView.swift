//
//  EditView.swift
//  wikiKitFirestore
//
//  Created by TEO on 4/30/24.
//

import SwiftUI


struct EditView: View {

    var firestoreManager = FireStoreManager()

    
    @Binding var showingEditSheet : Bool
    @Binding var myMemo : Memo

    

    var body: some View {
        NavigationStack {
            
            Form {
                TextField(myMemo.user, text : $myMemo.user)
                TextField(myMemo.contents, text : $myMemo.contents)
            }
            .navigationTitle("새로운 메모")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("취소") {
                        showingEditSheet.toggle()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("수정") {
                        firestoreManager.updateMemo(myMemo)
                        showingEditSheet.toggle()
                    }
                }
            }
            
        }

    }
}

