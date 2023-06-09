//
//  DataCard.swift
//  miniChallenge3
//
//  Created by Julia Mendes on 21/03/23.
//

import SwiftUI

struct DateCard: View {
    
    private let styleColor = DataColor.shared
    private let style = TextStyle.shared
    private let radius = 20.0
    private var dateAppointment: String
    
    init(dateAppointment: String) {
        self.dateAppointment = dateAppointment
    }
    var body: some View {
        GeometryReader { geometry in
            Rectangle()
                .fill(DataColor.shared.componentsColor)
                .frame(height: 60)
                .padding(.bottom, radius)
                .cornerRadius(CGFloat(radius))
            dateText
        }
    }
    var dateText: some View {
        Text(dateAppointment)
            .foregroundColor(styleColor.textComponentsColor)
            .font(.system(size: style.sizeDate, design: style.designDate))
            .fontWeight(style.weightDate)
            .padding(.top)
            .padding(.leading, 12)
    }
    
}
