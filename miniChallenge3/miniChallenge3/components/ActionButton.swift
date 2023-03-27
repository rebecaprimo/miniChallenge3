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
    private var action: () -> Void
    
    init(title: String, icon: String, color: Color, action: @escaping () -> Void){
        self.title = title
        self.icon = icon
        self.color = color
        self.action = action
    }
    
    var body: some View {
        
        Button {
            action()
        } label: {
            ZStack {
                Capsule()
                    .fill(color)
                    .frame(width: 100, height: 40)
                textAction
                
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

//struct ActionButton_Previews: PreviewProvider {
//    static var previews: some View {
//        ActionButton(title: "blabla", icon: "pencil", color: .yellow)
//    }
//}
