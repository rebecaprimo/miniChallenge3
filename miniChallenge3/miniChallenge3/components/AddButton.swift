//
//  AddButton.swift
//  miniChallenge3
//
//  Created by rebeca primo on 23/03/23.
//

import Foundation
import SwiftUI

struct AddButton: View {
    private let view: AnyView
    
    init(view: AnyView) {
        self.view = view
    }
    
    var body: some View {
        NavigationLink(destination: view, label: {
            VStack {
                Image(systemName: "plus")
                    .font(.system(size: 25))
            }
            
            .padding(.vertical, 25)
            .padding(.horizontal, 25)
            .foregroundColor(.white)
            .background(Color.blue)
            .cornerRadius(55)
        })
    }
}
