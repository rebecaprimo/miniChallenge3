//
//  SquareButton.swift
//  miniChallenge3
//
//  Created by rebeca primo on 28/03/23.
//

import Foundation
import SwiftUI

struct SquareButton: View {
    private let icon: String?
    
    init(icon: String) {
        self.icon = icon
    }
    
    var body: some View {
        if icon != nil {
            Button(action: {}) {
                Image(systemName: icon ?? "")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
        }
    }
}
