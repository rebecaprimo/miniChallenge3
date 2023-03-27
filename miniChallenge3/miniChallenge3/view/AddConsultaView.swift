//
//  AddConsultavIEW.swift
//  miniChallenge3
//
//  Created by rebeca primo on 23/03/23.
//

import Foundation
import SwiftUI

struct AddConsultaView: View {
    @State var specialist: String = ""
    @State var dateAppointment = Date()
    
    var body: some View {
        VStack {
            TextFieldCustom(title: "Especialidade")
            TextFieldCustom(title: "Doutor (a)")
            TextFieldCustom(title: "Clínica")
            VStack {
                DatePicker("Data", selection: $dateAppointment)
            }
            Spacer()
        }
    }
}

struct AddConsultaView_Previews: PreviewProvider {
    static var previews: some View {
        AddConsultaView()
    }
}
