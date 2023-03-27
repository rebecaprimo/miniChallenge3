//
//  ConsultasSheetView.swift
//  miniChallenge3
//
//  Created by Julia Mendes on 23/03/23.
//

import SwiftUI

struct ConsultasSheetView: View {
    
    
    var body: some View {
        
      
        VStack(alignment: .leading){
            VStack{
                HStack{
                    Spacer()
                    ActionButton(title: "Editar", icon: "pencil", color: .yellow, action: {print("Editado")})
                    ActionButton(title: "Excluir", icon: "trash", color: .red, action: {print("Excluido")})
                }
                .padding()
                Group {
                    DadosConsultaText(text: "Otorrinolaringologista")
                    DadosConsultaText(text: "Dr(a) Flavio Gustavo de Melo Roberto Oliveira da Silveira ")
                        .padding(.bottom,17)
                }
                .padding(.bottom,15)
                .multilineTextAlignment(.center)
            }
            VStack(alignment: .leading){
                Group {
                    DadosConsultaText(icon: "calendar", text: "Sexta-feira, 17/04/2019")
                    DadosConsultaText(icon: "clock", text: "9:38")
                    DadosConsultaText(icon: "mappin.and.ellipse", text: "Hospital Paulistano")
                }
                .padding(.bottom, 5)
            }
            .padding(.leading, 40)
            DadosConsultaText(icon: "paperclip", text: "Anexos")
                .padding([.top, .bottom], 40)
                .padding(.leading, 25)
            Spacer()
            
        }
    }
}

struct ConsultasSheetView_Previews: PreviewProvider {
    static var previews: some View {
        
        ConsultasSheetView()
    }
}

