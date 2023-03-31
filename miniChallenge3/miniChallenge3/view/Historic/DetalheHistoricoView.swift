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
        
        NavigationView{
            
            List {
                VStack{
                    Text(title)
                }
                ForEach(appointments) { appointment in
                    VStack(spacing: 0){
                        AppointmentRowView(appointment: appointment)
                    }}
            }
        }
    }
    
    
}
