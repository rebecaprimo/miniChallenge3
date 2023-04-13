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
        sortDescriptors: [NSSortDescriptor(keyPath: \Appointment.date, ascending: true)],
        animation: .spring()) private var appointments: FetchedResults<Appointment>
    @State private var query: String = ""
    @State private var oldDates = [Appointment]()
    private let historicVM = HistoricVM()
    
    private var searchResults: [Appointment]{
        if query.isEmpty {
            return oldDates
        } else {
            return oldDates.filter { appointment in
                let doctorName = appointment.doctor?.lowercased() ?? ""
                let specialty = appointment.specialty?.name?.lowercased() ?? ""
                let date = dateFormatter(Date: appointment.date).lowercased()
                let searchQuery = query.lowercased()
                return doctorName.contains(searchQuery) || specialty.contains(searchQuery) || date.contains(searchQuery)
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack{
                List {
                    ForEach(searchResults) { appointment in
                        AppointmentRowView(appointment: appointment)
                    }
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: 60)
                        .listRowBackground(Color.clear)
                }
                .scrollContentBackground(.hidden)
                .background(DataColor.shared.colorBackGround)
                .navigationTitle("Histórico")
                .onAppear {
                    oldDates = HistoricVM.shared.listAppointments(appointments)
                }
                
            }
            .searchable(text: $query, prompt: Text("Pesquise a especialidade"))
        }
    }
    
}




