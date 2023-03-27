//
//  DatePicker.swift
//  miniChallenge3
//
//  Created by rebeca primo on 23/03/23.
//

import Foundation
import SwiftUI

struct DatePickerComponent: View {
    @State var dateAppointment = Date()
    
    var body: some View {
        VStack {
            DatePicker("", selection: $dateAppointment)
        }
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerComponent()
    }
}
