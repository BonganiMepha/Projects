//
//  SwiftUiToDoListApp.swift
//  SwiftUiToDoList
//
//  Created by Bongani Mepha on 2022/09/15.
//

import SwiftUI

@main
struct SwiftUiToDoListApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            TaskListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
