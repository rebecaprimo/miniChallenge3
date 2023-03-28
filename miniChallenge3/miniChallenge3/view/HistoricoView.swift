//
//  HistoricoView.swift
//  miniChallenge3
//
//  Created by rebeca primo on 22/03/23.
//

import Foundation
import SwiftUI

struct HistoricoView: View {
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Specialty.id, ascending: true)],
        animation: .default)
    private var specialties: FetchedResults<Specialty>
    
    
    var body: some View {
        NavigationView {
            VStack {
                RectangleButton(title: "Geral", icon: nil, view: AnyView(InfoView()))
                
                ForEach(specialties) { specialty in
                    RectangleButton(title: specialty.name ?? "-", icon: nil, view: AnyView(InfoView()))
                }
                
                Spacer()
            }
            .navigationTitle("Histórico")
        }
    }
}

