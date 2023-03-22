//
//  ConsultasView.swift
//  miniChallenge3
//
//  Created by Julia Mendes on 22/03/23.
//

import SwiftUI

struct ConsultasView: View {
    var body: some View {
        
        NavigationView {
            ScrollView {
                CardAppointment(specialist: "Endocrino", doctor: "Paulo José", hour: "9h23", dateAppointment: "25 de março de 2022")
            }
            .navigationTitle("Consultas")
        }
    }
}

struct ConsultasView_Previews: PreviewProvider {
    static var previews: some View {
        ConsultasView()
    }
}
