//
//  wikiKitFirestoreApp.swift
//  wikiKitFirestore
//
//  Created by TEO on 4/28/24.
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct wikiKitFirestoreApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    //@StateObject var firestoreManager = FireStoreManager()

    
    var body: some Scene {
        WindowGroup {
            ContentView()
               // .environmentObject(firestoreManager)

        }
    }
}
