//
//  LaunchView.swift
//  miniChallenge3
//
//  Created by rebeca primo on 30/03/23.
//

import Foundation
import SwiftUI

struct SplashView: View {
    
    //    let persistenceController = PersistenceController.shareds
    @State var selectedTab: String = "list.bullet.clipboard"
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            CustomTabBar(selectedTab: $selectedTab)
                .ignoresSafeArea()
            //                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        } else {
            ZStack {
                DataColor.shared.backgroundSplashView
                    .ignoresSafeArea()
                VStack {
                    Image("appstore")
                        .resizable()
                        .cornerRadius(20)
                        .frame(width: 240, height: 240)
                        .scaledToFit()
                    Text("Consulte.")
                        .bold()
                        .font(.system(size: 40, design: .rounded))
                        .foregroundColor(.white)
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
