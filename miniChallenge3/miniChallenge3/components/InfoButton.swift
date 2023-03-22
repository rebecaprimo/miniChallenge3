//
//  infoButton.swift
//  miniChallenge3
//
//  Created by rebeca primo on 21/03/23.
//

import Foundation
import SwiftUI

struct InfoButton: View {
    private let icon: String
    private var title: String
    private let view: AnyView
    private var titleView: String
    
    init(title: String, icon: String, view: AnyView, titleView: String) {
        self.title = title
        self.icon = icon
        self.view = view
        self.titleView = titleView
    }
    
    var body: some View {
        
        NavigationLink(destination: view, label: {
            HStack {
                Image(systemName: icon)
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                
                Text(title)
                    .fontWeight(.semibold)
                    .font(.title)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 20)
            .padding(.horizontal, 15)
            .foregroundColor(.white)
            .background(Color.red)
            .cornerRadius(15)
        })
        .navigationBarTitle(titleView)
        .padding(10)
    }
}
