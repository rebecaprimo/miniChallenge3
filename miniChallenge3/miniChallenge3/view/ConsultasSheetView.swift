//
//  ConsultasSheetView.swift
//  miniChallenge3
//
//  Created by Julia Mendes on 23/03/23.
//

import SwiftUI

struct ConsultasSheetView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    private var appointment: Appointment
    
    init(appointment: Appointment) {
        self.appointment = appointment
    }
    
    var body: some View {
        
        VStack(alignment: .leading){
            VStack{
                HStack{
                    Spacer()
                    ActionButton(title: "Editar", icon: "pencil", color: .yellow, action: {print("Editado")})
                    ActionButton(title: "Excluir", icon: "trash", color: .red, action: {DataModelManager.shared.deleteAppointment(viewContext: viewContext, appointment: appointment)})
                }
                .padding()
                Group {
                    DadosConsultaText(text: appointment.specialty?.name ?? "-")
                    DadosConsultaText(text: appointment.doctor ?? "-")
                        .padding(.bottom, 17)
                }
                .padding(.bottom,15)
                .multilineTextAlignment(.center)
            }
            VStack(alignment: .leading){
                Group {
                    DadosConsultaText(icon: "calendar", text: dateFormatterStringAppointment(Date: appointment.date))
                    DadosConsultaText(icon: "clock", text: dateFormatterHourStringAppointment(Date: appointment.date))
                    DadosConsultaText(icon: "mappin.and.ellipse", text: appointment.local ?? "-")
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

func dateFormatterStringAppointment(Date: Date?) -> String{
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "pt-BR")
    formatter.dateFormat = "EEEE, MM/dd/yyyy"
    return formatter.string(from: Date ?? .now).capitalized
}

func dateFormatterHourStringAppointment(Date: Date?) -> String{
    let formatter = DateFormatter()
    formatter.locale = Locale(identifier: "pt-BR")
    formatter.dateFormat = "HH:mm"
    return formatter.string(from: Date ?? .now).capitalized
}
