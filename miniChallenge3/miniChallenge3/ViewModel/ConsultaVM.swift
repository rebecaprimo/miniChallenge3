//
//  ConsultaVM.swift
//  miniChallenge3
//
//  Created by Bruno Lafayette on 04/04/23.
//

import SwiftUI

class ConsultaVM{
    func listSpecialtiesWithNewMedicalAppointments(appointments: FetchedResults<Appointment>)-> [Appointment]{
        var newDates = [Appointment]()
        for appointment in appointments {
            if appointment.date! > .now {
                newDates.append(appointment)
            }
        }
        return newDates
    }
}
