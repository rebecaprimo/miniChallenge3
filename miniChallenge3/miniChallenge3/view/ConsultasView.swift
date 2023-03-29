//
//  ConsultasView.swift
//  miniChallenge3
//
//  Created by Julia Mendes on 22/03/23.
//

import SwiftUI


struct ConsultasView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Appointment.id, ascending: true)],
        animation: .default)
    private var appointments: FetchedResults<Appointment>
    
    var body: some View {
        VStack {
            NavigationView {
                ZStack{
                    List {
                        ForEach(appointments) { appointment in
                            if appointment.date! > .now {
                                VStack {
                                    DateCard(dateAppointment: dateFormatter(Date: appointment.date))
                                    DetailCard(appointment: appointment)
                                }
                                
                            }
                        }
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    }
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    .scrollContentBackground(.hidden)
                    .listStyle(PlainListStyle())
                    
                    VStack{
                        Spacer()
                        HStack() {
                            Spacer(minLength: 295)
                            AddButton(view: AnyView(AddConsultaView()))
                                .padding()
                        }
                    }
                    
                }
                .navigationTitle("Consultas")
            }
        }
        
    }
}

func dateFormatter(Date: Date?) -> String{
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "pt-br")
    formatter.dateFormat = "EEEE, d MMMM yyyy"
    return formatter.string(from: Date ?? .now).capitalized
}
