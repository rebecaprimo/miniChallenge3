//
//  PickerComponent.swift
//  miniChallenge3
//
//  Created by rebeca primo on 28/03/23.
//

import Foundation
import SwiftUI

struct PickerComponent: View {
    @State private var selectedSpecialty = "Acupuntura"
    let specialty = specialtyList
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Picker("", selection: $selectedSpecialty) {
                        ForEach(specialty, id: \.self) {
                            Text($0)
                        }
                    }
                }
            }
        }
    }
}
