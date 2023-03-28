//
//  DetalhesCard.swift
//  miniChallenge3
//
//  Created by Julia Mendes on 21/03/23.
//

import SwiftUI

struct DetailCard: View {

    private var appointment: Appointment
    private let style = TextStyle.shared
    @State private var showingSheet = false
    
    init(appointment: Appointment, showingSheet: Bool = false) {
        self.appointment = appointment
        self.showingSheet = showingSheet
    }
    
    var body: some View {
        Button {
            showingSheet = true
        } label: {
            GeometryReader { geometry in
                ZStack {
                    Rectangle()
                        .fill(.white)
                        //.frame(height: 150)
                        .border(.black)
                        .padding()
                    detailText
                }
            }
            .frame(height: 150)
        }
        .sheet(isPresented: $showingSheet) {
            ConsultasSheetView(appointment: appointment)
        }
    }
    
    var detailText: some View {
        HStack(alignment: .center){
            VStack(alignment: .leading, spacing: 15){
                Text(appointment.specialty?.name ?? "-")
                    .font(.system(size: style.sizeText))
                    .foregroundColor(.black)
                    .fontWeight(style.weightText)
                Text("Dr(a) " + (appointment.doctor ?? "-"))
                    .font(.title3)
                    .foregroundColor(.black)
                    .fontWeight(style.weightText)
            }
            .padding(.top, 9)
            Spacer()
            Text(dateFormatterHourStringAppointment(Date: appointment.date))
                .font(.title2)
                .foregroundColor(.black)
                .fontWeight(style.weightText)
            
        }
        .padding(50)
    }
}
