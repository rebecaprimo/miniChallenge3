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
        case deleteAppointment
        case edit
    }
    @State var showingAlert = false
    @State private var isActive = false
    @State private var action: Action?
    var appointment: Appointment
    
    init(appointment: Appointment) {
        self.appointment = appointment
    }
    
    var body: some View {
        ZStack{
            NavigationLink("", destination: destination, isActive: $isActive)
        }.hidden()
        DateCard(dateAppointment: dateFormatter(Date: appointment.date))
            .listRowInsets(EdgeInsets())
            .frame(height: 60)
        DetailCard(showSpecialty: true, appointment: appointment)
            .listRowInsets(EdgeInsets())
            .border(.black)
            .swipeActions() {
                Button("Deletar") {
                    withAnimation(.spring(), {showingAlert.toggle()})
                }.tint(.red)
                
                Button("Editar") {
                    action = .edit
                    isActive = true
                    }.tint(.yellow).foregroundColor(.black)
            }
            .onChange(of: isActive) {
                if !$0 {
                    action = nil
                }
            }
            .confirmationDialog("Essa ação não poderá ser desfeita", isPresented: $showingAlert, titleVisibility: .visible) {
                Button("Cancelar", role: .cancel, action: {return})
                Button("Deletar", role: .destructive, action: {DataModelManager.shared.deleteAppointment(viewContext: viewContext, appointment: appointment)})
            }
            .foregroundColor(.none)
    }
    
    @ViewBuilder
    private var destination: some View {
        if case .edit = action {
            EditarView(appointment: appointment)
        }
    }
}
