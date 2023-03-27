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
    @State private var showingSheet = false
    
    init(specialist: String, doctor: String, hour: String) {
        self.specialist = specialist
        self.doctor = doctor
        self.hour = hour
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
            ConsultasSheetView()
        }
        
    }
    
    var detailText: some View {
        HStack(alignment: .center){
            VStack(alignment: .leading, spacing: 15){
                Text(specialist)
                    .font(.system(size: 20))
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                Text(doctor)
                    .font(.title3)
                    .foregroundColor(.black)
            }
            .padding(.top, 9)
            Spacer()
            Text(hour)
                .font(.title2)
                .foregroundColor(.black)
            
        }
        .padding(50)
    }
}



//struct DetalhesCard_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailCard(specialist: "Otorrinolaringologista", doctor: "Gabriel", hour: "9h32")
//    }
//}
