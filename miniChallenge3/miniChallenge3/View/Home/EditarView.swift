//
//  EditarView.swift
//  miniChallenge3
//
//  Created by rebeca primo on 27/03/23.
//

import Foundation
import SwiftUI

struct EditarView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Appointment.id, ascending: true)],
        animation: .default)
    private var appointments: FetchedResults<Appointment>
    private let vmManager = DataModelManager.shared
    private let id: UUID
    @State var dr: String
    @State var local: String
    @State var dateAppointment: Date
    @State var selectedSpecialty: String
    
    init(appointment: Appointment) {
        self.id = appointment.id!
        _dr = State(initialValue: appointment.doctor ?? "")
        _local = State(initialValue: appointment.local ?? "")
        _dateAppointment = State(initialValue: appointment.date ?? Date())
        _selectedSpecialty = State(initialValue: appointment.specialty?.name ?? "Clinico Geral")
    }
    
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
                        
                        vmManager.editAppointment(viewContext: viewContext, appointments, id, dr, dateAppointment, local, selectedSpecialty)
                        dismiss()
                    }
                }
            }
        }
    }
}
