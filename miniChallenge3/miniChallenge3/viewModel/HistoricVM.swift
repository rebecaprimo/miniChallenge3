//
//  HistoricVM.swift
//  miniChallenge3
//
//  Created by Bruno Lafayette on 31/03/23.
//

import SwiftUI

struct HistoricVM{
    func listSpecialtiesWithOldMedicalAppointments(specialties: FetchedResults<Specialty>)-> [Specialty]{
        var oldDates = [Specialty]()
        for specialis in specialties {
            if let appointment = specialis.appointment {
                let appointmentArray = appointment.allObjects as! [Appointment]
                for appointment in appointmentArray {
                    if appointment.date ?? Date() < .now {
                        oldDates.append(specialis)
                        break
                    }
                }
            }
        }
        return oldDates
        
    }
}
