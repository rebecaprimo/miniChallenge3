//
//  ContentView.swift
//  miniChallenge3
//
//  Created by rebeca primo on 20/03/23.
//

import CoreData

extension NSFetchRequest where ResultType == Specialty {
    static func sortedById() -> NSFetchRequest<Specialty> {
        let request: NSFetchRequest<Specialty> = Specialty.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Specialty.id, ascending: true)]
        return request
    }
}

