//
//  DetalheHistoricoView.swift
//  miniChallenge3
//
//  Created by rebeca primo on 29/03/23.
//

import Foundation
import SwiftUI

struct DetalheHistoricoView: View {
    
    var appointments: [Appointment]
    var title: String
    
    init(appointments: [Appointment], title: String) {
        self.appointments = appointments
        self.title = title
    }
    
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


