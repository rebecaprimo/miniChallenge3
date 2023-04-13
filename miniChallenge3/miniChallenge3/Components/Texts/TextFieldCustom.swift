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
    @Binding var editing: Bool
    private var title: String
    private var activityOnChangeEditing: Bool = false
    
    init(title: String,_ content: Binding<String>) {
        self.title = title
        self._content = content
        self._editing = Binding.constant(false)
    }
    
    init(content: Binding<String>, editing: Binding<Bool>, title: String, activityOnChangeEditing: Bool) {
        self._content = content
        self._editing = editing
        self.title = title
        self.activityOnChangeEditing = activityOnChangeEditing
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.system(size: 20))
                .font(.callout)
                .bold()
            if activityOnChangeEditing{
                TextField("Digite uma especialidade", text: $content, onEditingChanged: { edit in
                    self.editing = edit}).padding(.horizontal, 10)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 20.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
            }else{
                TextField("", text: $content)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 20.0).strokeBorder(Color.black, style: StrokeStyle(lineWidth: 1.0)))
            }
        }
        .padding()
    }
}
