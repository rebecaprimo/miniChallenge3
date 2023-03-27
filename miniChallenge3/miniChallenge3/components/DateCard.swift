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
                .frame(height: 60)
                .padding(.bottom, radius)
                .cornerRadius(CGFloat(radius))
            dateText
        }
        .padding()
    }
    
    var dateText: some View {
        Text(dateAppointment)
            .font(.system(size: TextStyle.shared.sizeDate, design: TextStyle.shared.designDate))
            .padding(.top)
            .padding(.leading, 12)
    }
    
}

struct DataCard_Previews: PreviewProvider {
    static var previews: some View {
        DateCard(dateAppointment: "24 de março de 2021")
    }
}
