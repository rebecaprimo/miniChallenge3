//
//  DatePicker.swift
//  miniChallenge3
//
//  Created by rebeca primo on 23/03/23.
//

import Foundation
import SwiftUI

struct DatePickerComponent: View {
    @Binding var dateAppointment: Date
    private var title: String = ""
    
    init(title: String, dateAppointment: Binding<Date>) {
        self.title = title
        self._dateAppointment = dateAppointment
    }
    
    var body: some View {
        VStack {
            DatePicker(title, selection: $dateAppointment)
                .padding(16)
        }
        .font(.system(size: 20))
        .font(.callout)
        .bold()
    }
}

