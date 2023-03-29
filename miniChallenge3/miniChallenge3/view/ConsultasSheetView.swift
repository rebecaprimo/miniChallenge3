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
        
        VStack{
            VStack(alignment: .center){
                Group {
                    DadosConsultaText(text: appointment.specialty?.name ?? "-")
                    DadosConsultaText(text: "Dr(a) " + (appointment.doctor ?? "-"))
                        .padding(.bottom, 17)
                }
            }
            
            VStack(alignment: .leading){
                Group {
                    DadosConsultaText(icon: "calendar", text: dateFormatterStringAppointment(Date: appointment.date))
                    DadosConsultaText(icon: "clock", text: dateFormatterHourStringAppointment(Date: appointment.date))
                    DadosConsultaText(icon: "mappin.and.ellipse", text: appointment.local ?? "-")
                }
                .padding(.bottom, 5)
                .frame(width: 300, alignment: .leading)
            }
            DadosConsultaText(icon: "paperclip", text: "Anexos")
                .frame(width: 300, alignment: .leading)
                .padding(.top, 40)
            Spacer()
        }
        .offset(y: 40)
        .presentationDetents([.medium, .large])
        .presentationDragIndicator(.visible)
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
