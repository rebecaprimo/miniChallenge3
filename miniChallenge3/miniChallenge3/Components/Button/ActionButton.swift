//
//  ActionButton.swift
//  miniChallenge3
//
//  Created by Julia Mendes on 23/03/23.
//

import SwiftUI

struct ActionButton: View {
    private var title: String
    private let icon: String
    private let color: Color
    private let isEdit: Bool
    private let view: AnyView?
    private var action: (() -> Void)?
    
    init(title: String, icon: String, color: Color, action: (() -> Void)?, view: AnyView?, isEdit: Bool){
        self.title = title
        self.icon = icon
        self.color = color
        self.action = action
        self.view = view
        self.isEdit = isEdit
    }
    
    var body: some View {
        if isEdit {
            NavigationLink(destination: view, label: {
                ZStack {
                    Capsule()
                        .fill(color)
                        .frame(width: 100, height: 40)
                    textAction

                }
            })
        } else {
            Button { action!()
            } label: {
                ZStack {
                    Capsule()
                        .fill(color)
                        .frame(width: 100, height: 40)
                    textAction
                    
                }
            }
        }
    }
    
    var textAction: some View {
        HStack {
            Image(systemName: icon)
                .frame(alignment: .trailing)
            Text(title)
            
        }
    }
}

