//
//  DataModelManager.swift
//  miniChallenge3
//
//  Created by Bruno Lafayette on 26/03/23.
//

import CoreData
import SwiftUI

struct DataModelManager{
    
    static let shared = DataModelManager()
    @Environment(\.managedObjectContext) private var viewContext

    func addSpecialty(name: String) {
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
    
    
    func deleteItems(offsets: IndexSet) {
        withAnimation {
//            offsets.map { items[$0] }.forEach(viewContext.delete)

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
