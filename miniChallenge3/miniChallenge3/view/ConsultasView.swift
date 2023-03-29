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
                            DateCard(dateAppointment: dateFormatter(Date: appointment.date))
                                .listRowInsets(EdgeInsets())
                                .frame(height: 60)
                            DetailCard(appointment: appointment)
                                .listRowInsets(EdgeInsets())
                                .border(.black)
                                .swipeActions {
                                    NavigationLink(destination: EditarView()) {
                                        Image(systemName: "pencil")
                                    }
                                    Button {
                                        DataModelManager.shared.deleteAppointment(viewContext: viewContext, appointment: appointment)
                                    } label: {
                                        Image(systemName: "trash")
                                    }
                                }
                            
                            Spacer()
                            
                        }
                    }
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.visible)
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
