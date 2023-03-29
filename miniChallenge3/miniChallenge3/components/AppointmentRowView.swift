//
//  AppointmentRowList.swift
//  miniChallenge3
//
//  Created by Bruno Lafayette on 29/03/23.
//

import SwiftUI
struct AppointmentRowView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    enum Action {
        case view
        case edit
    }
    
    @State private var isActive = false
    @State private var action: Action?
    let appointment: Appointment
    
    var body: some View {
        ZStack{
            NavigationLink("", destination: destination, isActive: $isActive)
        }.hidden()
        DateCard(dateAppointment: dateFormatter(Date: appointment.date))
            .listRowInsets(EdgeInsets())
            .frame(height: 60)
        DetailCard(appointment: appointment)
            .listRowInsets(EdgeInsets())
            .border(.black)
            .swipeActions() {
                Button("Deletar") {
                    DataModelManager.shared.deleteAppointment(viewContext: viewContext, appointment: appointment)
                }.tint(.red)
                
                Button("Editar") {
                    action = .edit
                    isActive = true
                }.tint(.yellow)
            }
            .onChange(of: isActive) {
                if !$0 {
                    action = nil
                }
            }
    }
    
    @ViewBuilder
    private var destination: some View {
        if case .edit = action {
            EditarView(appointment: appointment)
        }
    }
}
