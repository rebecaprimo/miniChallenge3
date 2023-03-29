//
//  TextField.swift
//  miniChallenge3
//
//  Created by rebeca primo on 23/03/23.
//

import Foundation
import SwiftUI

struct TextFieldCustom: View {
    @Binding var content: String
    private var title: String
    
    init(title: String,_ content: Binding<String>) {
        self.title = title
        self._content = content
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 20))
                .font(.callout)
                .bold()
            TextField("", text: $content)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 20.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
        }
        .padding()
    }
}
