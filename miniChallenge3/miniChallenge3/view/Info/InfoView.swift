//
//  InfoScreen.swift
//  miniChallenge3
//
//  Created by rebeca primo on 21/03/23.
//

import Foundation
import SwiftUI

struct InfoView: View {

    var body: some View {
        
        VStack {
            NavigationView {
                
                VStack{
                    RectangleButton(title: "Termos de Uso", icon: "doc.text", view: AnyView(TermosView()))
                    RectangleButton(title: "Privacidade", icon: "lock", view: AnyView(PrivacidadeView()))
                    RectangleButton(title: "Contato",  icon: "phone", view: AnyView(ContatoView()))
                    RectangleButton(title: "Configurações",  icon: "gearshape", view: AnyView(ConfiguracoesView()))
                    
                    Spacer()
                }
                .background(DataColor.shared.colorBackGround)
                .navigationTitle("Informações")
            }
        }
    }
}

