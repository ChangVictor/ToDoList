//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Victor Chang on 06/10/2023.
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
struct ToDoListApp: App {

    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    init() {}

    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
