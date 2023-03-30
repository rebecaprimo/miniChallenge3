//
//  AddConsultavIEW.swift
//  miniChallenge3
//
//  Created by rebeca primo on 23/03/23.
//

import Foundation
import SwiftUI
import PhotosUI
import QuickLook

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
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImage: Data? = nil
    
    var body: some View {
        
        ScrollView {
            
            VStack(alignment: .leading) {

                PickerComponent(selectedSpecialty: $selectedSpecialty)
                TextFieldCustom(title: "Médico", $dr)
                DatePickerComponent(title: "Data e hora", dateAppointment: $dateAppointment)
                TextFieldCustom(title: "Clínica", $local)
                
                if let selectedImage, let uiImage = UIImage(data: selectedImage) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(20)
                }
                
                Text("Adicionar")
                    .padding(17)
                    .font(.system(size: 20))
                    .font(.callout)
                    .bold()
                Spacer()
                
                HStack {
                    PhotosPicker(selection: $selectedItem, matching: .images, photoLibrary: .shared()){
                        SquareButton(icon: "camera.fill")
                        //Text("Clique")
                    }
                    .onChange(of: selectedItem) { novo in
                        Task {
                            if let data = try? await novo?.loadTransferable(type: Data.self) {
                                selectedImage = data
                            }
                        }
                    }
                    
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
