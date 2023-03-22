//
//  TitleText.swift
//  miniChallenge3
//
//  Created by rebeca primo on 22/03/23.
//

import Foundation
import SwiftUI

struct TitleText: View {
    private var newText: String
    
    init(newText: String) {
        self.newText = newText
    }
    
    var body: some View {
        Text(newText)
            .fontWeight(.semibold)
            .font(.system(size: 20))
            .font(.title)
    }
}
