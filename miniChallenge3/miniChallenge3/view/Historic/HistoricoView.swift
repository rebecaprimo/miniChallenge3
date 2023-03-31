//
//  HistoricoView.swift
//  miniChallenge3
//
//  Created by rebeca primo on 22/03/23.
//

import CoreData
import SwiftUI

struct HistoricoView: View {
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Specialty.name, ascending: true)],
        animation: .linear) private var specialties: FetchedResults<Specialty>
    @State private var query: String = ""

    
    var body: some View {

        NavigationView {
            ScrollView {
                ForEach(specialties) { specialty in
                    NavigationLink {
                        List{
                            if let appointments = specialty.appointment {
                                let appointmentsArray = appointments.allObjects as! [Appointment]
                                
                                
                                DetalheHistoricoView(appointments: appointmentsArray, title: specialty.name ?? "Geral")
                                
                                
//                                ForEach(appointmentsArray){ appointment in
//                                    AppointmentRowView(appointment: appointment)
//                                }
//                                .listRowBackground(Color.clear)
//                                .listRowSeparator(.hidden)
                            } else {
                                EmptyView()
                            }
                        }.scrollContentBackground(.hidden)
                    } label: {
                        RectangleButton(title: specialty.name ?? "-", icon: nil, view: nil)
                    }
                    
                }
                .navigationTitle("Histórico")
                .background(DataColor.shared.colorBackGround)
                .searchable(text: $query, prompt: Text("Pesquise a especialidade"))
            }
        }
    }
    
}
