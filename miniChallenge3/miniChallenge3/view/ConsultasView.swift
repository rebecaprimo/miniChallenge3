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
        NavigationView {
            ZStack{
                List {
                    ForEach(appointments) { appointment in
                        if appointment.date ?? .now > .now{
                            AppointmentRowView(appointment: appointment)
                        }

                    }
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                }
                
                VStack{
                    HStack() {
                        Spacer()
                        AddButton(view: AnyView(AddConsultaView()))
                            .padding()
                    }
                }.offset(x: 0, y: 210)
                
            }
            .background(DataColor.shared.colorBackGround)
            .navigationTitle("Consultas")
        }
    }
    
    
}

func dateFormatter(Date: Date?) -> String{
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "pt-br")
    formatter.dateFormat = "EEEE, d MMMM yyyy"
    return formatter.string(from: Date ?? .now).capitalized
}

