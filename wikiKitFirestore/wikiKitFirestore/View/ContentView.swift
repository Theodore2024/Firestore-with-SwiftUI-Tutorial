//
//  ContentView.swift
//  wikiKitFirestore
//
//  Created by TEO on 4/28/24.
//

import SwiftUI
import Firebase


struct ContentView: View {

    var firestoreManager = FireStoreManager()
    
    @State private var showingAddingSheet: Bool = false
    @State private var showingEditSheet: Bool = false

    @State private var memoToEdit: Memo = Memo(id: "", user: "", contents: "")
    
    var body: some View {
        NavigationStack{
            List {
                ForEach(firestoreManager.memos, id:\.self) { memo in
                    VStack(alignment: .leading) {
                        
                        HStack(alignment: .bottom) {
                            Text(memo.user)
                                .font(.title)
                            Spacer()
                            Text("작성자")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        .padding(.bottom, 10)
                        
                        Text(memo.contents)
                    }
                    .contextMenu {
                        Button {
                            firestoreManager.removeMemo(memo)
                        } label: {
                            Text("Remove")
                            Image(systemName: "trash")
                        }
                        
                        Button {
                            memoToEdit = memo
                            showingEditSheet.toggle()
                        } label: {
                            Text("Edit")
                            Image(systemName: "pencil")
                        }
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Memo")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        showingAddingSheet.toggle()
                    }
                }
            }
            .sheet(isPresented: $showingAddingSheet) {
                AddView(firestoreManager: firestoreManager, showingAddSheet: $showingAddingSheet)
            }
            .sheet(isPresented: $showingEditSheet) {
                EditView(firestoreManager: firestoreManager, showingEditSheet: $showingEditSheet, myMemo: $memoToEdit)
            }
            .onAppear {
                firestoreManager.fetchMemos()
            }
            .refreshable {
                firestoreManager.fetchMemos()
            }
        }
    }
}



