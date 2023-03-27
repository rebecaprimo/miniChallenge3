//
//  CardConsulta.swift
//  miniChallenge3
//
//  Created by Julia Mendes on 20/03/23.
//

import SwiftUI

struct CardAppointment: View {
    
    private var specialist: String
    private var doctor: String
    private var hour: String
    private var dateAppointment: String
    
    init(specialist: String, doctor: String, hour: String, dateAppointment: String) {
        self.specialist = specialist
        self.doctor = doctor
        self.hour = hour
        self.dateAppointment = dateAppointment
    }
    
    var body: some View {
        VStack{
            DateCard(dateAppointment: dateAppointment)
            DetailCard(specialist: specialist, doctor: doctor, hour: hour)
            
        }
    }
}



struct CardConsulta_Previews: PreviewProvider {
    static var previews: some View {
        CardAppointment(specialist: "Otorrinolaringologista", doctor: "Gabriel", hour: "9h32", dateAppointment: "24 de março de 2024")
    }
}
