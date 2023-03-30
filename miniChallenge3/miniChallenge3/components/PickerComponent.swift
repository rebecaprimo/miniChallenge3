//
//  PickerComponent.swift
//  miniChallenge3
//
//  Created by rebeca primo on 28/03/23.
//

import Foundation
import SwiftUI

struct PickerComponent: View {
    @Binding private var selectedSpecialty: String
    let specialty = specialtyList
    
    init(selectedSpecialty: Binding<String>) {
        self._selectedSpecialty = selectedSpecialty
    }
    
    var body: some View {
        Text("Especialidade")
            .padding([.top, .leading], 20)
            .font(.system(size: 20))
            .font(.callout)
            .bold()
        ZStack{
            RoundedRectangle(cornerRadius: 20.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0))
                .frame(height: 55)
            Picker("", selection: $selectedSpecialty) {
                ForEach(specialty, id: \.self) { specialty in
                    Text(specialty)
                }
            }
        }.padding()
    }
}



