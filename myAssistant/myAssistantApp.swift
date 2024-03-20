//
//  myAssistantApp.swift
//  myAssistant
//
//  Created by 蔡忠良 on 2024/2/22.
//

import SwiftUI

@main
struct myAssistantApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
