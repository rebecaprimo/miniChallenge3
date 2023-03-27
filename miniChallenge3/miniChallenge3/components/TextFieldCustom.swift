//
//  TextField.swift
//  miniChallenge3
//
//  Created by rebeca primo on 23/03/23.
//

import Foundation
import SwiftUI

struct TextFieldCustom: View {
    @State var content: String = ""
    private var title: String
    
    init(title: String) {
        self.title = title
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 20))
                .font(.callout)
                .bold()
            TextField("", text: $content)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}

