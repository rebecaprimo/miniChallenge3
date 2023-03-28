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
                    
                    ScrollView {
                        
                        ForEach(appointments) { appointment in
                            if appointment.date! > .now{
                                DateCard(dateAppointment: dateFormatter(Date: appointment.date))
                                DetailCard(appointment: appointment)
                            }
                        }
                        
                    }
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
