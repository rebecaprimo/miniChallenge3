//
//  DetalheHistoricoView.swift
//  miniChallenge3
//
//  Created by rebeca primo on 29/03/23.
//

import Foundation
import SwiftUI

struct DetalheHistoricoView: View {
    private var specialty: Specialty
    
    init(specialty: Specialty) {
        self.specialty = specialty
    }
    
    var body: some View {
        VStack {
            
        }
        .navigationTitle(specialty.name ?? "Especialidade")
    }
}
