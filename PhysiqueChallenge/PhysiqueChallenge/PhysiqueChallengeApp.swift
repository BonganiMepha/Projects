//
//  PhysiqueChallengeApp.swift
//  PhysiqueChallenge
//
//  Created by Bongani Mepha on 2023/03/21.
//

import SwiftUI

@main
struct PhysiqueChallengeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
