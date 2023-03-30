//
//  LaunchView.swift
//  miniChallenge3
//
//  Created by rebeca primo on 30/03/23.
//

import Foundation
import SwiftUI

struct SplashView: View {
    let persistenceController = PersistenceController.shared
    @State var selectedTab: String = "list.bullet.clipboard"
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
//            CustomTabBar(selectedTab: $selectedTab)
//                .ignoresSafeArea()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        } else {
            VStack {
                VStack {
                    Image("firstuseillustration")
                        .font(.system(size: 40))
                    Text("Aplicativo Saúde")
                        .bold()
                        .foregroundColor(.black)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.isActive = true
                }
            }
        }
    }
}
