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
    @State private var query: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    //RectangleButton(title: "Geral", icon: nil, view: AnyView(DetalheHistoricoView(specialty: specialties)))
                    
                    ForEach(specialties) { specialty in
                        RectangleButton(title: specialty.name ?? "-", icon: nil, view: AnyView(DetalheHistoricoView(specialty: specialty)))
                    }
                    
                    Spacer()
                }
                .navigationTitle("Histórico")
            }
            .background(DataColor.shared.colorBackGround)
        }
        .searchable(text: $query, prompt: Text("Search"))
    }
}

