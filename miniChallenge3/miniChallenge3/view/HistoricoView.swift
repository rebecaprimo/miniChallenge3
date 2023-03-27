//
//  HistoricoView.swift
//  miniChallenge3
//
//  Created by rebeca primo on 22/03/23.
//

import SwiftUI
import CoreData

struct HistoricoView: View {
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Specialty.name, ascending: true)],
        animation: .default)
    
    private var specialties: FetchedResults<Specialty>
    
    var body: some View {
        NavigationView {
            VStack {
                if specialties.isEmpty{
                    Text("Nenhuma consulta agendada")
                } else {
                    VStack{
                        ForEach(specialties) { especialty in
                            RectangleButton(title: especialty.name!, icon: nil, view: AnyView(InfoView()))
                        }
                    }
                    Spacer()
                }
            }
            .navigationTitle("Histórico")
        }
    }
}

struct HistoricoView_Previews: PreviewProvider {
    static var previews: some View {
        HistoricoView()
    }
}
