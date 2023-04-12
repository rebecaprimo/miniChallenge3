//
//  FilterComponent.swift
//  miniChallenge3
//
//  Created by rebeca primo on 12/04/23.
//

import Foundation
import SwiftUI

struct FilterComponent: View {
    @State private var searchText: String = ""
    @State private var filteredList: [String] = specialtyList
    
    var body: some View {
        Text("Especialidade")
            .padding([.top, .leading], 20)
            .font(.system(size: 20))
            .font(.callout)
            .bold()
        ZStack {
            RoundedRectangle(cornerRadius: 20.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0))
                .frame(height: 55)
            TextField("Search", text: $searchText)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal) // Adicione um espaçamento horizontal para evitar sobreposição com a lista
            List(filteredList.filter({ searchText.isEmpty ? true : $0.localizedCaseInsensitiveContains(searchText) }), id: \.self, rowContent: { item in
                Text(item)
            })
        }
        .padding()
    }
}



