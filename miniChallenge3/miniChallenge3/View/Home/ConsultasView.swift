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
        sortDescriptors: [NSSortDescriptor(keyPath: \Appointment.date, ascending: true)],
        animation: .default)
    private var appointments: FetchedResults<Appointment>
    private var isEmpty: Bool = true
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(appointments) { appointment in
                        if appointment.date ?? .now > .now {
                            AppointmentRowView(appointment: appointment)
                        }
                    }
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                }.scrollContentBackground(.hidden)
                VStack {
                    HStack {
                        Spacer()
                        AddButton(view: AnyView(AddConsultaView()))
                            .padding()
                    }
                }.offset(x: 0, y: -343)
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
