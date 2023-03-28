//
//  DataModelManager.swift
//  miniChallenge3
//
//  Created by Bruno Lafayette on 27/03/23.
//

import CoreData
import SwiftUI

struct DataModelManager{
    
    static let shared = DataModelManager()
    
    func addSpecialty(name: String, viewContext: NSManagedObjectContext) {
        withAnimation {
            let newSpecialty = Specialty(context: viewContext)
            newSpecialty.name = name
            newSpecialty.id = UUID()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    func addAppointment(_ doctor: String,_ date: Date,_ local: String, viewContext: NSManagedObjectContext) {
        withAnimation {
            let newAppointment = Appointment(context: viewContext)
            newAppointment.id = UUID()
            newAppointment.doctor = doctor
            newAppointment.date = date
            newAppointment.local = local

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    func deleteAppointment(viewContext: NSManagedObjectContext, appointment: Appointment) {
        withAnimation {
            
            viewContext.delete(appointment)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    
}
