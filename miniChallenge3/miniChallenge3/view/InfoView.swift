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
                    RectangleButton(title: "Privacidade", icon: "lock.doc", view: AnyView(PrivacidadeView()))
                    RectangleButton(title: "Suporte",  icon: "heart", view: AnyView(SuporteView()))
                    RectangleButton(title: "Configurações",  icon: "heart", view: AnyView(ConfiguracoesView()))
                    
                    Spacer()
                }
                .navigationTitle("Informações")
            }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
