//
//  HistoricoView.swift
//  miniChallenge3
//
//  Created by rebeca primo on 22/03/23.
//

import Foundation
import SwiftUI

struct HistoricoView: View {
    var body: some View {
        NavigationView {
            VStack {
                RectangleButton(title: "Especialidade", icon: nil, view: AnyView(InfoView()))
                RectangleButton(title: "Especialidade", icon: nil, view: AnyView(InfoView()))
                RectangleButton(title: "Especialidade", icon: nil, view: AnyView(InfoView()))
                RectangleButton(title: "Especialidade", icon: nil, view: AnyView(InfoView()))
                
                Spacer()
            }
            .navigationTitle("Histórico")
        }
    }
}

struct HistoricoView_Previews: PreviewProvider {
    static var previews: some View {
        HistoricoView()
    }
}
