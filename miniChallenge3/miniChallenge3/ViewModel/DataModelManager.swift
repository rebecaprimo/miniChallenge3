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
            let fetchRequest: NSFetchRequest<Specialty> = Specialty.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "name == %@", name)
            let newSpecialty = try? viewContext.fetch(fetchRequest).first ?? Specialty(context: viewContext)
            if nullIDValidator(id: newSpecialty?.id){
                newSpecialty?.name = name
                newSpecialty?.id = UUID()
                save(viewContext)
                return newSpecialty
            } else {return newSpecialty}
        }
    }
    
    private func nullIDValidator(id: UUID?) -> Bool{
        let validatedID = (id == nil) ? true : false
        return validatedID
    }
    
    
    func addAppointment(_ doctor: String,_ date: Date,_ local: String, viewContext: NSManagedObjectContext,_ specialty: Specialty) {
        withAnimation {
            let newAppointment = Appointment(context: viewContext)
            newAppointment.id = UUID()
            newAppointment.doctor = doctor
            newAppointment.date = date
            newAppointment.local = local
            specialty.addToAppointment(newAppointment)
            save(viewContext)
        }
    }
    
    func editAppointment(viewContext: NSManagedObjectContext,_ appointments: FetchedResults<Appointment>,_ id: UUID,_ nameDoctor: String,_ dateAppointment: Date,_ local: String,_ specialtyName: String){
        guard let specialty = addSpecialty(name: specialtyName, viewContext: viewContext) else {return}
        for appointment in appointments {
            if appointment.id == id {
                appointment.doctor = nameDoctor
                appointment.date = dateAppointment
                appointment.local = local
                specialty.addToAppointment(appointment)
                save(viewContext)
            }
        }
    }
    
    func deleteAppointment(viewContext: NSManagedObjectContext, appointment: Appointment) {
        withAnimation {
            viewContext.delete(appointment)
            save(viewContext)
        }
    }
    
    private func save(_ viewContext: NSManagedObjectContext){
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
    
    
}
