//
//  HistoricVM.swift
//  miniChallenge3
//
//  Created by Bruno Lafayette on 31/03/23.
//

import SwiftUI

class HistoricVM{
    
    static let shared = HistoricVM()
    
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
    
    func listAppointments(_ appointments: FetchedResults<Appointment>) -> [Appointment]{
        var listAppointment = [Appointment]()
        for appointment in appointments {
            listAppointment.append(appointment)
        }
        return listAppointment
    }
    
    
    func listAppointmentsString(_ appointments: FetchedResults<Appointment>) -> [String]{
        var listAppointment = [String]()
        for appointment in appointments {
            listAppointment.append(appointment.doctor ?? "")
            listAppointment.append(appointment.specialty?.name ?? "")
            listAppointment.append(dateFormatterStringAppointment(Date: appointment.date))
        }
        return listAppointment
    }
    
//    func arrayAppointments(_ appointments: FetchedResults<Appointment>) -> [Appointment]{
//        var listAppointment = [Appointment]()
//        for appointment in appointments {
//            listAppointment.append(appointment.doctor ?? "")
//            listAppointment.append(appointment.specialty?.name ?? "")
//            listAppointment.append(dateFormatterStringAppointment(Date: appointment.date))
//        }
//        return listAppointment
//    }
    
    
    
}
