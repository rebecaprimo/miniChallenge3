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
        VStack(alignment: .leading) {
            PickerComponent()
            TextFieldCustom(title: "Médico", $dr)
            DatePickerComponent(title: "Data e hora")
            TextFieldCustom(title: "Clínica", $local)
            Text("Adicionar")
                .padding(17)
                .font(.system(size: 20))
                .font(.callout)
                .bold()
            Spacer()
            
            HStack(alignment: .center) {
                SquareButton(icon: "camera.fill")
                SquareButton(icon: "photo.on.rectangle")
            }
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
