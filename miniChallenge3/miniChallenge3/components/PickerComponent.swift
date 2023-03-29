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
                Section {
                    Picker("", selection: $selectedSpecialty) {
                        ForEach(specialty, id: \.self) {
                            Text($0)
                        }
                    }
                }
            }
        }


