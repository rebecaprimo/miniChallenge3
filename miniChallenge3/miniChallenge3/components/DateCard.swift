//
//  DataCard.swift
//  miniChallenge3
//
//  Created by Julia Mendes on 21/03/23.
//

import SwiftUI

struct DateCard: View {
    
    let radius = 20.0
    private var dateAppointment: String
    
    init(dateAppointment: String) {
        self.dateAppointment = dateAppointment
    }
    var body: some View {
        GeometryReader { geometry in
            Rectangle()
                .fill(.blue)
                .frame(width: geometry.size.width, height: 60)
                .padding(.bottom, radius)
                .cornerRadius(CGFloat(radius))
            dateText
        }
        .padding()
//        .frame(width: .infinity, height: 60)
    }
    
    var dateText: some View {
        Text(dateAppointment)
            .font(.title2)
            .padding()
    }
    
}

struct DataCard_Previews: PreviewProvider {
    static var previews: some View {
        DateCard(dateAppointment: "24 de março de 2021")
    }
}
