//
//  ConsultasView.swift
//  miniChallenge3
//
//  Created by Julia Mendes on 22/03/23.
//

import SwiftUI


struct ConsultasView: View {
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        ZStack {
            NavigationView {
                ScrollView {
                    CardAppointment(specialist: "Endocrino", doctor: "Paulo José", hour: "9h23", dateAppointment: "25 de março de 2022")
                    
                    

                    AddButton(view: AnyView(AddConsultaView()))
                    
                    
                    
                }
                .navigationTitle("Consultas")
            }
            VStack{
                Spacer()
                HStack() {
                    Spacer(minLength: 295)
                        .padding()
                        
                }
            }
        }
    }
}

struct ConsultasView_Previews: PreviewProvider {
    static var previews: some View {
        ConsultasView()
    }
}
