//
//  DataColor.swift
//  miniChallenge3
//
//  Created by Julia Mendes on 24/03/23.
//

import SwiftUI

class DataColor {
    
    static let shared = DataColor()
    
    let colorTab: Color = Color(UIColor(named: "tabBarColor")!)
    let colorButton: Color = .init(red: 0.403, green: 0.443, blue: 0.75)
    let colorBackGround: Color = Color(UIColor(named: "backGroundColor")!)
    let componentsColor: Color = Color(UIColor(named: "componentsColor")!)
    let textComponentsColor: Color = Color(UIColor(named: "textComponentsColor")!)
    let colorIconActive: Color = Color(UIColor(named: "colorIcons")!)
    let colorIconInative: Color = Color(UIColor(named: "colorIconInative")!)
    let colorCard: Color = .white
    let backgroundSplashView: Color = Color(UIColor(named: "backGraundSplash")!)

}
