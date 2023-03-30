//
//  AddConsultavIEW.swift
//  miniChallenge3
//
//  Created by rebeca primo on 23/03/23.
//

import Foundation
import SwiftUI

struct AddConsultaView: View {

    @Environment(\.dismiss) private var dismiss
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Specialty.id, ascending: true)],
        animation: .default)
    private var specialties: FetchedResults<Specialty>
    private let vmManager = DataModelManager.shared
    @State var specialist: String = ""
    @State var dr: String = ""
    @State var local: String = ""
    @State var dateAppointment = Date()
    @State var selectedSpecialty: String = ""
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading) {

                PickerComponent(selectedSpecialty: $selectedSpecialty)
                TextFieldCustom(title: "Médico", $dr)
                DatePickerComponent(title: "Data e hora", dateAppointment: $dateAppointment)
                TextFieldCustom(title: "Clínica", $local)
                Text("Adicionar")
                    .padding(17)
                    .font(.system(size: 20))
                    .font(.callout)
                    .bold()
                Spacer()
                
                HStack {
                    SquareButton(icon: "camera.fill")
                    SquareButton(icon: "photo.on.rectangle")
                }
                .padding(.leading, 40)
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Adicionar")
            .background(DataColor.shared.colorBackGround)
            .ignoresSafeArea()
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Salvar") {
                        vmManager.addAppointment(dr, dateAppointment, local, viewContext: viewContext, vmManager.addSpecialty(name: selectedSpecialty, viewContext: viewContext, specialty: specialties) ?? nil)
                        dismiss()
                    }
                }
            }
        }
    }
}
