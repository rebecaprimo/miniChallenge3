//
//  DataCard.swift
//  miniChallenge3
//
//  Created by Julia Mendes on 21/03/23.
//

import SwiftUI

struct DateCard: View {
    
    private let style = TextStyle.shared
    private let radius = 20.0
    private var dateAppointment: String
    
    init(dateAppointment: String) {
        self.dateAppointment = dateAppointment
    }
    var body: some View {
        GeometryReader { geometry in
            Rectangle()
                .fill(DataColor.shared.colorTab)
                .frame(height: 60)
                .border(.black)
                .padding(.bottom, radius)
                .cornerRadius(CGFloat(radius))
            dateText
        }
        .padding()
    }
    
    var dateText: some View {
        Text(dateAppointment)
            .foregroundColor(.white)
            .font(.system(size: style.sizeDate, design: style.designDate))
            .fontWeight(style.weightDate)
            .padding(.top)
            .padding(.leading, 12)
    }
    
}
