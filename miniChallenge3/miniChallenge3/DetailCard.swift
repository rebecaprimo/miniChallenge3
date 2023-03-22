//
//  DetalhesCard.swift
//  miniChallenge3
//
//  Created by Julia Mendes on 21/03/23.
//

import SwiftUI

struct DetailCard: View {
    private var specialist: String
    private var doctor: String
    private var hour: String
    
    init(specialist: String, doctor: String, hour: String) {
        self.specialist = specialist
        self.doctor = doctor
        self.hour = hour
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .fill(.gray)
                    .frame(width: geometry.size.width * 0.92, height: 150)
                    .padding()
                detailText
            }
        }
        .frame(width: .infinity, height: 150)
    }
    
    var detailText: some View {
        HStack(alignment: .center){
            VStack(alignment: .leading, spacing: 15){
                Text(specialist)
                    .font(.title2)
                Text(doctor)
                    .font(.title3)
            }
            .padding(.top, 9)
            Spacer()
            Text(hour)
                .font(.title2)
            
        }
        .padding(50)
    }
}



struct DetalhesCard_Previews: PreviewProvider {
    static var previews: some View {
        DetailCard(specialist: "Otorrinolaringologista", doctor: "Gabriel", hour: "9h32")
    }
}

