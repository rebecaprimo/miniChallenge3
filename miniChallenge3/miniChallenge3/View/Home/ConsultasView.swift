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
                    VStack{
                        
                        Text("Seus agendamentos em um só lugar!")
                            .font(TextStyle.shared.designTextBodyBold)
                            .padding(.bottom,10)
                        Text("Você não possui nenhum agendamento")
                            .font(TextStyle.shared.designTextBody)
                            .padding(.bottom,70)
                        Image("firstuseillustration")
                    }
                } else {
                    List {
                        ForEach(appointments) { appointment in
                                AppointmentRowView(appointment: appointment)
                        }
                        .listRowBackground(Color.clear)
                        .listRowSeparator(.hidden)
                        Rectangle()
                            .fill(Color.clear)
                            .frame(height: 60)
                            .listRowBackground(Color.clear)
                    }
                    .padding(.top, 90)
                    .scrollContentBackground(.hidden)
                    
                }
                VStack {
                    HStack {
                        Text("Agendamentos")
                            .font(.system(.largeTitle, design: .rounded, weight: .bold))
                        Spacer()
                        AddButton(view: AnyView(AddConsultaView()))
                            .padding()
                    }
                }
                .offset(x: 0, y: -343)
                .padding(EdgeInsets(top: 50, leading: 20, bottom: 0, trailing: 20))
            }
            .navigationBarHidden(true)
            .navigationTitle("Agendamentos")
        }
    }
}





