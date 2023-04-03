//
//  DetalhesCard.swift
//  miniChallenge3
//
//  Created by Julia Mendes on 21/03/23.
//

import SwiftUI

struct DetailCard: View {
    
    @ObservedObject private var appointment: Appointment
    private let style = TextStyle.shared
    private let styleColor = DataColor.shared
    private var showSpecialty = false
    @State private var showingSheet = false
    private let radius = 20.0
    
    init(showSpecialty: Bool, appointment: Appointment, showingSheet: Bool = false) {
        self.appointment = appointment
        self.showingSheet = showingSheet
        self.showSpecialty = showSpecialty
    }
    
    var body: some View {
        Button {
            showingSheet = true
        } label: {
            GeometryReader { geometry in
                Rectangle()
                    //.padding(.top, radius)
                    .strokeBorder(lineWidth: 2)
                    .background(Rectangle().fill(.black))
                    .roundedCorner(20, corners: [.bottomRight, .bottomLeft])
                    .frame(height: 120)
                    .padding(.bottom)
                
                Rectangle()
                    //.padding(.top, radius)
                    .strokeBorder(lineWidth: 2)
                    .background(Rectangle().fill(.white))
                    .roundedCorner(20, corners: [.bottomRight, .bottomLeft])
                    .frame(height: 115)
                    .padding(.bottom)
                
                detailText
            }
        }
        .frame(height: 120)
        .sheet(isPresented: $showingSheet) {
            ConsultasSheetView(appointment: appointment)
        }
    }
    
    var detailText: some View {
        HStack(alignment: .center){
            VStack(alignment: .leading, spacing: 15){
                
                if showSpecialty {
                    Text(appointment.specialty?.name ?? "-")
                        .font(.system(size: style.sizeText))
                        .foregroundColor(.black)
                        .fontWeight(style.weightText)
                }

                Text("Dr. " + (appointment.doctor ?? "-"))
                    .font(.title3)
                    .foregroundColor(.black)
                    .fontWeight(style.weightText)
            }
            Spacer()
            Text(dateFormatterHourStringAppointment(Date: appointment.date))
                .font(.title2)
                .foregroundColor(.black)
                .fontWeight(style.weightText)
            
        }
        .padding(20)
    }
}

extension View {
    func roundedCorner(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
