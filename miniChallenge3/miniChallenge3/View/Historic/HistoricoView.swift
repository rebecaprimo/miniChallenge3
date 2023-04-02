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
    @State private var oldDates = [Specialty]()
    private let historicVM = HistoricVM()
    var body: some View {
        
        NavigationView {
            VStack{
                ScrollView {
                    
                    NavigationLink {
                        
                    } label: {
                        RectangleButton(title: "Geral", icon: nil, view: nil)
                    }

                    ForEach(specialties) { specialty in
                        NavigationLink {
                            List{
                                if let appointments = specialty.appointment {
                                    let appointmentsArray = appointments.allObjects as! [Appointment]
                                    
                                    ForEach(appointmentsArray){ appointment in
                                        if appointment.date ?? .now < .now {
                                            AppointmentRowView(appointment: appointment)
                                        }
                                    }
                                    .navigationTitle(specialty.name ?? "Geral")
                                    .listRowBackground(Color.clear)
                                    .listRowSeparator(.hidden)
                                } else {
                                    EmptyView()
                                }
                            }.scrollContentBackground(.hidden)
                        } label: {
                            if oldDates.contains(specialty) {
                                RectangleButton(title: specialty.name ?? "-", icon: nil, view: nil)
                            }
                        }
                    }
                    .navigationTitle("Histórico")
                    .searchable(text: $query, prompt: Text("Pesquise a especialidade"))
                }
                
            }
            .background(DataColor.shared.colorBackGround)
            .onAppear {
                oldDates = historicVM.listSpecialtiesWithOldMedicalAppointments(specialties: specialties)
                
            }
        }
    }
}
