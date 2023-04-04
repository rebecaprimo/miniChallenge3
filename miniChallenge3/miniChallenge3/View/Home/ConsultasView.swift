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
        predicate: NSPredicate(format: "date > %@", Date() as NSDate),
        animation: .default) private var appointments: FetchedResults<Appointment>
    
    var body: some View {
        NavigationView {
            ZStack {
                DataColor.shared.colorBackGround
                    .ignoresSafeArea()
                if appointments.isEmpty{
                    Image("firstuseillustration")
                } else {
                    List {
                        ForEach(appointments) { appointment in
                                AppointmentRowView(appointment: appointment)
                        }
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                    }
                    .padding(.top, 90)
                    .scrollContentBackground(.hidden)
                    
                }
                VStack {
                    HStack {
                        Text("Consultas")
                            .font(.system(.largeTitle, design: .rounded, weight: .bold))
                        //                    .font(.system(size: 34, weight: .bold, design: .rounded))
                        Spacer()
                        AddButton(view: AnyView(AddConsultaView()))
                            .padding()
                    }
                }
                .offset(x: 0, y: -343)
                .padding(EdgeInsets(top: 50, leading: 20, bottom: 0, trailing: 20))
            }
            .navigationBarHidden(true)
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

