//
//  SuggestionTextFieldMenu.swift
//  miniChallenge3
//
//  Created by Bruno Lafayette on 13/04/23.
//

import SwiftUI

public struct SuggestionTextFieldMenu: View {
    

    @Binding var editing: Bool
    @Binding var inputText: String
    @State var verticalOffset: CGFloat
    @State var horizontalOffset: CGFloat
    @State private var listSpecialty = specialtyList

    private var filterSpecialty: Binding<[String]> {
        Binding {
            return listSpecialty.filter {$0.lowercased().contains(inputText.lowercased())}
        } set: { _ in}

    }
    
    public init(editing: Binding<Bool>, text: Binding<String>) {
        self._editing = editing
        self._inputText = text
        self.verticalOffset = 0
        self.horizontalOffset = 0
    }
    
    public init(editing: Binding<Bool>, text: Binding<String>, verticalOffset: CGFloat, horizontalOffset: CGFloat) {
        self._editing = editing
        self._inputText = text
        self.verticalOffset = verticalOffset
        self.horizontalOffset = horizontalOffset
    }
    
    public var body: some View {
        
        ScrollView {
            LazyVStack(spacing: 0) {
                ForEach(filterSpecialty.wrappedValue, id: \.self) { textSearched in
                    
                    Text(textSearched)
                        .padding(.horizontal, 25)
                        .padding(.vertical, 25)
                        .frame(minWidth: 0,
                               maxWidth: .infinity,
                               minHeight: 0,
                               maxHeight: 50,
                               alignment: .leading)
                        .contentShape(Rectangle())
                        .onTapGesture(perform: {
                            inputText = textSearched
                            editing = false
                            self.endTextEditing()
                        })
                    Divider()
                        .padding(.horizontal, 10)
                }
            }
        }.background(Color.white)
        
        .cornerRadius(15)
        .foregroundColor(Color(.black))
        .ignoresSafeArea()
        .frame(maxWidth: .infinity,
               minHeight: 0,
               maxHeight: 50 * CGFloat( (filterSpecialty.wrappedValue.count > 3 ? 3: filterSpecialty.wrappedValue.count)))
        .shadow(radius: 4)
        .padding(.horizontal, 25)
        .offset(x: horizontalOffset, y: verticalOffset)
        .isHidden(!editing, remove: !editing)
        
    }
    
}


