//
//  InfoScreen.swift
//  miniChallenge3
//
//  Created by rebeca primo on 21/03/23.
//

import Foundation
import SwiftUI

struct InfoView: View {
    @Environment(\.openURL) var openURL
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
                    
                    Button {
                        let mailto = "mailto:consulteapp@gmail.com".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                        print(mailto ?? "")
                        if let url = URL(string: mailto!) {
                            openURL(url)
                        }
                    } label: {
                        RectangleButton(title: "Contato",  icon: "phone", view: nil)
                    }
                    
                    Button {
                        openURL(URL(string: UIApplication.openSettingsURLString)!)
                    } label: {
                        RectangleButton(title: "Configurações",  icon: "gearshape", view: nil)
                    }
                    
                    Spacer()
                }
                .background(DataColor.shared.colorBackGround)
                .navigationTitle("Informações")
            }
        }
    }
}

