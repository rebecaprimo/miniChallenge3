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
                    Button {
                        if let urlTerms = URL(string: "https://consulte-beryl.vercel.app/termosUso.html"){
                            UIApplication.shared.open(urlTerms)
                        }
                    } label: {
                        RectangleButton(title: "Termos de Uso", icon: "doc.text", view: nil)
                    }
                    Button {
                        if let urlPrivacity = URL(string: "https://consulte-beryl.vercel.app/politicasPrivacidade.html"){
                            UIApplication.shared.open(urlPrivacity)
                        }
                    } label: {
                        RectangleButton(title: "Privacidade", icon: "lock", view: nil)
                    }

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

