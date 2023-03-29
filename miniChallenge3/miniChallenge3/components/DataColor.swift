//
//  DataColor.swift
//  miniChallenge3
//
//  Created by Julia Mendes on 24/03/23.
//

import SwiftUI

class DataColor{
    
    static let shared = DataColor()
    
    let colorTab: Color = .init(red: 0.122, green: 0.106, blue: 0.208)
    let colorButton: Color = .init(red: 0.403, green: 0.443, blue: 0.75)
    let colorBackGround: Color = Color(UIColor(named: "backGroundColor")!)
    let componentsColor: Color = Color(UIColor(named: "componentsColor")!)
    
    let colorCard: Color = .white
    let colorTextWhite: Color = .white
    let colorTextBlack: Color = .black
    
}
