//
//  infoButton.swift
//  miniChallenge3
//
//  Created by rebeca primo on 21/03/23.
//

import Foundation
import SwiftUI

struct RectangleButton: View {
    
    private let style = DataColor.shared
    private let icon: String?
    private var title: String
    private let view: AnyView
    
    init(title: String, icon: String?, view: AnyView) {
        self.title = title
        self.icon = icon
        self.view = view
    }
    
    var body: some View {
        
        NavigationLink(destination: view, label: {
            HStack {
                if icon != nil {
                    Image(systemName: icon!)
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                }
                
                Text(title)
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                    .font(.title)
                    
                Spacer()
                
                Image(systemName: "chevron.right")
                    .frame(alignment: .trailing)
            }
            .frame(height: 50)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 20)
            .padding(.horizontal, 15)
            .foregroundColor(style.colorTextWhite)
            .background(style.componentsColor)
            .cornerRadius(20)
        })
        .padding([.trailing, .leading], 10)
        .padding(5)
    }
}
