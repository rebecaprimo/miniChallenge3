//
//  DetalhesCard.swift
//  miniChallenge3
//
//  Created by Julia Mendes on 21/03/23.
//

import SwiftUI

struct DetailCard: View {

    private var appointment: Appointment
    @State private var showingSheet = false
    
    init(appointment: Appointment, showingSheet: Bool = false) {
        self.appointment = appointment
        self.showingSheet = showingSheet
    }
    
    var body: some View {
        Button {
            print("Funciona")
            showingSheet = true
            
        } label: {
            GeometryReader { geometry in
                ZStack {
                    Rectangle()
                        .fill(.gray)
                        .frame(height: 150)
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
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                Text(appointment.doctor ?? "-")
                    .font(.title3)
                    .foregroundColor(.black)
            }
            .padding(.top, 9)
            Spacer()
//            Text(hour ?? "-")
//                .font(.title2)
//                .foregroundColor(.black)
            
        }
        .padding(50)
    }
}
