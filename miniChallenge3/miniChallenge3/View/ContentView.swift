//
//  ContentView.swift
//  miniChallenge3
//
//  Created by rebeca primo on 20/03/23.
//

import CoreData
import SwiftUI

extension NSFetchRequest where ResultType == Specialty {
    static func sortedById() -> NSFetchRequest<Specialty> {
        let request: NSFetchRequest<Specialty> = Specialty.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(keyPath: \Specialty.id, ascending: true)]
        return request
    }
}

public extension View {
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
    func endTextEditing() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil, from: nil, for: nil)
    }
}

func dateFormatter(Date: Date?) -> String{
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "pt-br")
    formatter.dateFormat = "EEEE, d MMMM yyyy"
    return formatter.string(from: Date ?? .now).capitalized
}

func dateFormatterStringAppointment(Date: Date?) -> String{
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "pt-BR")
    formatter.dateFormat = "EEEE, dd/MM/yyyy"
    return formatter.string(from: Date ?? .now).capitalized

    }

func dateFormatterHourStringAppointment(Date: Date?) -> String{
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "pt-BR")
    formatter.dateFormat = "HH:mm"
    return formatter.string(from: Date ?? .now).capitalized
}
