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

    
    func addSpecialty(name: String, viewContext: NSManagedObjectContext) -> Specialty? {
        withAnimation {
//            @FetchRequest(fetchRequest: NSFetchRequest.sortedById(), animation: .default)
//            var specialties: FetchedResults<Specialty>
//            let newSpecialty = Specialty(context: viewContext)
//            for specialtyName in specialties {
//                if specialtyName.name == name {
//                    return specialtyName
//                }
//            }
            let fetchRequest: NSFetchRequest<Specialty> = Specialty.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "name == %@", name)
            let newSpecialty = try? viewContext.fetch(fetchRequest).first ?? Specialty(context: viewContext)
            newSpecialty?.name = name
            newSpecialty?.id = UUID()
            do {
                try viewContext.save()
                return newSpecialty
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    func addAppointment(_ doctor: String,_ date: Date,_ local: String, viewContext: NSManagedObjectContext,_ specialty: Specialty) {
        withAnimation {
            
            
            
            let newAppointment = Appointment(context: viewContext)
            newAppointment.id = UUID()
            newAppointment.doctor = doctor
            newAppointment.date = date
            newAppointment.local = local
            specialty.addToAppointment(newAppointment)
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    func editAppointment(viewContext: NSManagedObjectContext,_ appointments: FetchedResults<Appointment>,_ id: UUID?, nameDoctor: String, dateAppointment: Date, local: String){
        
        guard let idAppointment = id else {return}
        
        for appointment in appointments {
            if appointment.id == idAppointment {
                appointment.doctor = nameDoctor
                appointment.date = dateAppointment
                appointment.local = local
                do {
                    try viewContext.save()
                } catch {
                    let nsError = error as NSError
                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                }
            }
        }
        
        
    }
    
    func deleteAppointment(viewContext: NSManagedObjectContext, appointment: Appointment) {
        withAnimation {
            viewContext.delete(appointment)
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    
}
