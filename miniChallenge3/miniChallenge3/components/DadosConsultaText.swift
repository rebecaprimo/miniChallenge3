//
//  DadosConsultaText.swift
//  miniChallenge3
//
//  Created by Julia Mendes on 23/03/23.
//

import SwiftUI

struct DadosConsultaText: View {

    //MARK: Pensar em com vamos manipular e exibir a data.
    
    private var icon: String
    private var text: String
    
    //init para colocar icone e texto (data, lugar, hora e anexo)
    init(icon: String, text: String) {
        self.icon = icon
        self.text = text
    }
    //Init para colocar especialidade e doutor, chamar duas vezes na sheetview
    init(text: String) {
        self.icon = ""
        self.text = text
    }

    var body: some View {
        
        HStack{
            if(icon != "") {
                Image(systemName: icon)
                    .fontWeight(.bold)
                    .font(.system(size: 20))
            }
            Text(text)
                .fontWeight(.semibold)
                .font(.system(size: 20))
        }
    }
}

struct DadosConsultaText_Previews: PreviewProvider {
    static var previews: some View {
        DadosConsultaText(icon: "pencil", text: "Hospital Paulistano")
    }
}
