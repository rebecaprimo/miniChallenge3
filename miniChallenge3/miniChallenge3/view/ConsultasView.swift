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
        ZStack {
            NavigationView {
                ScrollView {
                    
                    ForEach(appointments) { appointment in
                        DetailCard(specialist: "Teste", doctor: appointment.doctor)
                    }
                    
                    
                    //CardAppointment(specialist: "Endocrino", doctor: "Paulo José", hour: "9h23", dateAppointment: "25 de março de 2022")
                    
                    
                    
                    
                    

                    AddButton(view: AnyView(AddConsultaView()))
                    
                    
                    
                }
                .navigationTitle("Consultas")
            }
            VStack{
                Spacer()
                HStack() {
                    Spacer(minLength: 295)
                        .padding()
                        
                }
            }
        }
    }
}


private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()
