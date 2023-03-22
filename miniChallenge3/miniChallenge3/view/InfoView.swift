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
                    InfoButton(title: "Termos de Uso", icon: "doc.text", view: AnyView(TermosView()), titleView: "Termos de Uso")
                    InfoButton(title: "Políticas de Privacidade", icon: "lock.doc", view: AnyView(PoliticasView()), titleView: "Termos de Uso")
                    InfoButton(title: "Suporte",  icon: "heart", view: AnyView(SuporteView()), titleView: "B")
                    InfoButton(title: "Configurações",  icon: "heart", view: AnyView(ConfiguracoesView()), titleView: "C")
                }
            }
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
