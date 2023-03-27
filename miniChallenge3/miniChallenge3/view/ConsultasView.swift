//
//  ConsultasView.swift
//  miniChallenge3
//
//  Created by Julia Mendes on 22/03/23.
//

import SwiftUI

struct ConsultasView: View {
    var body: some View {
        ZStack {
            NavigationView {
                ScrollView {
                    CardAppointment(specialist: "Endocrino", doctor: "Paulo José", hour: "9h23", dateAppointment: "25 de março de 2022")
                }
                .navigationTitle("Consultas")
            }
            VStack{
                Spacer()
                HStack() {
                    Spacer(minLength: 295)
                    CircleButton("plus", buttonTabBar: false, nil, nil, action: {
                        
                        DataModelManager.shared.addSpecialty(name: "Endocrinologista")

                        
                    })
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
