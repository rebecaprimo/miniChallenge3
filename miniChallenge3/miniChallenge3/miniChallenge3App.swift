//
//  miniChallenge3App.swift
//  miniChallenge3
//
//  Created by rebeca primo on 20/03/23.
//

import SwiftUI

@main
struct miniChallenge3App: App {
    let persistenceController = PersistenceController.shared
    @State var selectedTab: String = "list.bullet.clipboard"

    var body: some Scene {
        WindowGroup {
            CustomTabBar(selectedTab: $selectedTab)
                .ignoresSafeArea()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

