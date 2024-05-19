//
//  AddView.swift
//  wikiKitFirestore
//
//  Created by TEO on 4/30/24.
//

import SwiftUI

struct AddView: View {

    var firestoreManager = FireStoreManager()

    @Binding var showingAddSheet : Bool
    
    @State private var userName : String = ""
    @State private var contents : String = ""
    

    var body: some View {
        NavigationStack {
            
            Form {
                TextField("사용자 이름", text : $userName)
                TextField("메모", text : $contents)
            }
            .navigationTitle("새로운 메모")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("취소") {
                        showingAddSheet.toggle()
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("추가") {
                        let memo : Memo = Memo(id: UUID().uuidString, user: userName, contents: contents)
                        firestoreManager.addMemo(memo)
                        showingAddSheet.toggle()
                    }
                }
            }
            
        }
    }
}
