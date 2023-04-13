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
        ZStack {
            DataColor.shared.colorBackGround
                .ignoresSafeArea()
            VStack {
                VStack(alignment: .center){
                    Group {
                        DadosConsultaText(text: appointment.specialty?.name ?? "-")
                        DadosConsultaText(text: "Dr. " + (appointment.doctor ?? "-"))
                            .padding(.bottom, 17)
                            .padding(.top, 10)
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
//                DadosConsultaText(icon: "paperclip", text: "Anexos")
//                    .frame(width: 300, alignment: .leading)
//                    .padding(.top, 40)
                Spacer()
            }
            .offset(y: 40)
            .presentationDetents([.medium, .large])
            .presentationDragIndicator(.visible)
            .background(DataColor.shared.colorBackGround)
            .ignoresSafeArea()
        }
    }
}


