//
//  EditarView.swift
//  miniChallenge3
//
//  Created by rebeca primo on 27/03/23.
//

import Foundation
import SwiftUI

struct EditarView: View {
    
    private var appointment: Appointment
    
    init(appointment: Appointment) {
        self.appointment = appointment
    }
    
    var body: some View {
        Text(appointment.doctor ?? "-")
        Text(appointment.specialty?.name ?? "-")
    }
}
