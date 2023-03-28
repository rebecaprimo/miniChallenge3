//
//  AddConsultavIEW.swift
//  miniChallenge3
//
//  Created by rebeca primo on 23/03/23.
//

import Foundation
import SwiftUI

struct AddConsultaView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State var specialist: String = ""
    @State var dr: String = ""
    @State var local: String = ""
    @State var dateAppointment = Date()
    private let vmManager = DataModelManager.shared
    
    var body: some View {
        VStack {
            TextFieldCustom(title: "Especialidade", $specialist)
            TextFieldCustom(title: "Dr.", $dr)
            TextFieldCustom(title: "Clínica", $local)
            VStack {
                DatePicker("Data", selection: $dateAppointment)
            }
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Adicionar")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Salvar") {
                   vmManager.addAppointment(dr, dateAppointment, local, viewContext: viewContext, vmManager.addSpecialty(name: specialist, viewContext: viewContext))
                }
            }
        }
    }
}
