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
                    .foregroundColor(DataColor.shared.colorIconInative)
                    .frame(width: 60, height: 60)
                    .background(DataColor.shared.componentsColor)
                    .clipShape(Circle())
                   .font(.system(size: 25))
            }.navigationBarHidden(true)
 
        })
    }
}
