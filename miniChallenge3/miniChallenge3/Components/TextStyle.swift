//
//  TextStyle.swift
//  miniChallenge3
//
//  Created by Julia Mendes on 24/03/23.
//

import SwiftUI

class TextStyle {
    
    static let shared = TextStyle()
    
    
    let designFont: Font.Design = .rounded

    let designPageTitle: Font.Design = .rounded
    let weightPageTitle: Font.Weight = .bold
    let sizePageTitle: CGFloat = 34

    let designSubTitle: Font.Design = .rounded
    let weightSubTitle: Font.Weight = .bold
    let sizeSubTitle: CGFloat = 20

    let designDate: Font.Design = .rounded
    let weightDate: Font.Weight = .semibold
    let sizeDate: CGFloat = 20

    let designText: Font.Design = .rounded
    let weightText: Font.Weight = .bold
    let sizeText: CGFloat = 20

    let designButtonTitle: Font.Design = .rounded
    let weightButtonTitle: Font.Weight = .bold
    let sizeoButtonTitle: CGFloat = 16
    
}
